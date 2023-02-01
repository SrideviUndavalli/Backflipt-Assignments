 #! /usr/bin/bash
 #copying one directory to another directory
 mkdir a
 cd a
 touch hai{1..4}
 cd ..
 mkdir b
 cd b
 touch hello{1..5}
 cd ..
 cp -r a b
