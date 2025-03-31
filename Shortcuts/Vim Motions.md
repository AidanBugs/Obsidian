---
date: 12/21/24
tags:
  - Tips
  - 2nd-Brain
links: 
deadline: 
status:
---
# VIM Commands
hjkl -> navigation
h -> left
j -> down
k -> up
l -> right
gg -> start of page
G -> end of page
0 -> start of line
$ -> end of line
{} -> up and down paragraphs

iIaAoO -> editing mode
i -> insert mode left
a -> insert mode right
A -> insert mode end
I -> insert mode start
o -> insert mode newline below
O -> insert mode newline above

xr - making changes while in command mode
x -> delete characters
r -> replace characters

webB -> moving around by words
w -> jump to beginning of next word
e -> jump to end of word
b -> jump back to word
B -> jump to front of word

d -> delete mode? 
dd -> delete line
dj -> delete line below
dk -> delete line above
dw -> delete word

u -> undo
ctrl + r -> redo

/ -> search
q -> record (idk what this does yet)

v -> visual mode
V -> visual mode select line
ctrl + v -> block visual mode, insert multiple cursors
y -> copy highlighted
yy -> copy line
yw -> copy word
p -> paste

:%y+ -> copy entire file
