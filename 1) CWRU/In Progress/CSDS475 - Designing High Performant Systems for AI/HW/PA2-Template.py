import torch
from torch.utils.data import Dataset, DataLoader, random_split
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms

import time
from lightning_fabric import Fabric

batch = 256 # Ive done 16,32,64,128
epochs = 2

# The cnn model class.
class EX_CNN(nn.Module):
    """
    Example CNN model for image classification.
    """
    def __init__(self):
        super(EX_CNN, self).__init__()
        # Define convolutional layers
        self.convolution_layers = nn.Sequential(
            nn.Conv2d(in_channels=3, out_channels=32, kernel_size=3, stride=1),
            nn.ReLU(),
            nn.MaxPool2d(kernel_size=2, stride=2),
            nn.BatchNorm2d(num_features=32),
            nn.Conv2d(in_channels=32, out_channels=32, kernel_size=3, stride=1),
            nn.ReLU(),
            nn.MaxPool2d(kernel_size=2, stride=2),
            nn.BatchNorm2d(num_features=32),
            nn.Conv2d(in_channels=32, out_channels=32, kernel_size=3, stride=1),
            nn.ReLU(),
            nn.MaxPool2d(kernel_size=2, stride=2),
            nn.BatchNorm2d(num_features=32),
        )
        
        # Define fully connected layers
        self.linear_layers = nn.Sequential(
            nn.Linear(in_features=128, out_features=64),
            nn.ReLU(),
            nn.BatchNorm1d(num_features=64),
            nn.Linear(in_features=64, out_features=64),
            nn.ReLU(),
            nn.BatchNorm1d(num_features=64),
            nn.Linear(in_features=64, out_features=64),
            nn.ReLU(),
            nn.BatchNorm1d(num_features=64),
            nn.Linear(in_features=64, out_features=64),
            nn.ReLU(),
            nn.BatchNorm1d(num_features=64),
            nn.Linear(in_features=64, out_features=10),  # Output layer for 10 classes
        )

    def forward(self, x):
        """
        Forward pass through the network.
        """
        x = self.convolution_layers(x)  # Apply convolutional layers
        x = torch.flatten(x, start_dim=1)  # Flatten the output for fully connected layers
        x = self.linear_layers(x)  # Apply fully connected layers
        return x

# Use an Nvidia GPU if available, otherwise use the CPU.
device = ("cuda" if torch.cuda.is_available() else "cpu")

gpus = 1
if device == "cuda":
    gpus = torch.cuda.device_count()


fabric = Fabric(accelerator=device, devices=gpus, strategy="ddp" if gpus > 1 else "auto")

fabric.launch()

fabric.print("The device that you are using is: ", device, "x", gpus)
fabric.print(f"Starting batch size{batch}")

# Load the CIFAR-10 training dataset
with fabric.rank_zero_first():
    training_data = datasets.CIFAR10(root="./data", train=True, download=True, transform=transforms.ToTensor())

# Create a DataLoader for batching and shuffling
training_loader = DataLoader(training_data, batch_size=batch, shuffle=True, num_workers=1)

# Instantiate your model.
Ex_Net = EX_CNN()

# If you want, you can print the structure of your model.
fabric.print(Ex_Net)

# Specify the loss function and optimizer that you will use.
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(params = Ex_Net.parameters(), lr = 0.001)

# You can print out the device that you are using to verify that it is a GPU.
fabric.print("The device that you are using is: ", device)

Ex_Net, optimizer = fabric.setup(Ex_Net, optimizer)
training_loader = fabric.setup_dataloaders(training_loader)

start = time.time()
# Run your model for "x" epochs.
for epoch in range(epochs):
    running_loss = 0.0

    # This iterates over the data within an epoch.
    for i, data in enumerate(iterable = training_loader, start = 0):
        inputs, labels = data

        optimizer.zero_grad()

        outputs = Ex_Net(inputs)
        loss = criterion(outputs, labels)
        fabric.backward(loss)
        optimizer.step()
        
        running_loss += loss.item()

        # This prints the loss every 20 batches.
        if i % 20 == 19:
            fabric.print(f'[{epoch + 1}, {i + 1:5d}] loss: {running_loss / 20:.3f}')
            running_loss = 0.0

fabric.barrier()

# This is just here to let you know that your model has finished training.
fabric.print(f"Finished training for batch size {batch} in {time.time()-start:.2f} s on {gpus} GPUs")
