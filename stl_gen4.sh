#!/bin/bash
APP_STR="/cygdrive/c/Program Files/OpenSCAD/openscad.exe"
# for depth in 0 1 2 3 4; do
#  for gap in 0 1 2; do
#    for join in Off Seam Join; do
for depth in 0.5 ; do
  for gap in 0.5 ; do
    for join in Off Seam Full ; do
# this works manually
#  "/cygdrive/c/Program Files/OpenSCAD/openscad.exe" -o  "$(cygpath -w ./test_cubes-3.stl)" "$(cygpath -w ./test_cubes-3.scad)"  -D LABEL1=1 -D LABEL2=2 -D LABEL3=3
#
#	  "${APP_STR%}" -DLABEL1=DEPTH=$depth -DLABEL2=GAP=$gap -DLABEL3=JOIN=$join -o cube$depth$gap$join.stl "$(cygpath -w ./test_cubes-3.scad)" 
	  "${APP_STR%}" -o cube$depth$gap$join.stl "$(cygpath -w ./test_cubes-4.scad)" -D LABEL1=$depth -D LABEL2=$gap -D LABEL3=\"$join\"  
    done
  done
done
#_EOF_
