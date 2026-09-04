#include <iostream>
#include <fstream>
#include <vector>
#include <iterator>
#include <algorithm>

using namespace std;

double* readFileToArray(const string& filename, size_t& count) {
    ifstream file1(filename);

    count = 0;
    double temp;
    while (file1 >> temp) {
        ++count;
    }
    file1.close();

    double* arr = new double[count];

    ifstream file2(filename);

    for (size_t i = 0; i < count; ++i) {
        file2 >> arr[i];
    }
    file2.close();

    return arr;
}


int main()
{
    size_t count1 = 0;
    double* arr1 = readFileToArray("data/random_vector_1.txt", count1);

    cout << "Problem 1) Vec1 has length ";
    cout << count1;

    size_t count2 = 0;
    double* arr2 = readFileToArray("data/random_vector_2.txt", count2);

    cout << "\n\nProblem 2) Vec2 has length ";
    cout << count2;

  ifstream file("data/random_vector_1.txt");
  
  vector<double> vec1;

  copy(
      istream_iterator<double>(file),
      istream_iterator<double>(),
      back_inserter(vec1));

  ifstream file2("data/random_vector_2.txt");
  
  vector<double> vec2;

  copy(
      istream_iterator<double>(file2),
      istream_iterator<double>(),
      back_inserter(vec2));

  cout << "\n\nProblem 3) \n\tVec1 first 10: \n\t\t";

  for (int i = 0; i < 10; i++){
    cout << vec1[i] << "\n\t\t";
  }

  cout << "\n\tVec2 first 10: \n\t\t";

  for (int i = 0; i < 10; i++){
    cout << vec2[i] << "\n\t\t";
  }

  vector<double> hadamard;

  for (int i = 0; i < vec1.size(); i++){
    hadamard.push_back(vec1[i]*vec2[i]);
  }

  ofstream out("data/hadamard.txt");

  copy(hadamard.begin(), hadamard.end(), ostream_iterator<double>(out, " ")); 

  cout << "\n\nProblem 5: Hadamard product written to data/hadamard.txt";

  ifstream file3("data/resulting_vector.txt");

  vector<double> res;

  copy(
      istream_iterator<double>(file3),
      istream_iterator<double>(),
      back_inserter(res));

  hadamard.clear();

  ifstream file4("data/hadamard.txt");

  copy(
      istream_iterator<double>(file4),
      istream_iterator<double>(),
      back_inserter(hadamard));


  bool same = true;

  for (int i = 0; i < res.size(); i++){
    // Was marking -20.3172 as not equal to -20.3172 so adding a tolerance threshold
    double abs(hadamard[i] - res[i]);
    if (abs > 0.0001){
      same = false;
      cout << "\n";
      cout << abs << "\n";
      cout << hadamard[i] << ", ";
      cout << res[i];
      break;
    }
  }

  cout << "\n\nProblem 6 (with residual tolerance of 0.0001): ";
  cout << same;

  cout << "\n\t\tNote that 1 is true annd 0 is false";

  delete[] arr1;
  delete[] arr2;
  file.close();
  file2.close();
  file3.close();
  file4.close();

  return 0;
}
