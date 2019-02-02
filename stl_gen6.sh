#!/bin/bash
APP_STR="/cygdrive/c/Program Files/OpenSCAD/openscad.exe"
# for depth in 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0; do
#  for gap in 0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0; do
#    for join in Off Seam Join; do
for depth in 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0; do
  for gap in 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 ; do
    for join in Off Seam Full ; do
# this works manually
#  "/cygdrive/c/Program Files/OpenSCAD/openscad.exe" -o  "$(cygpath -w ./test_cubes-3.stl)" "$(cygpath -w ./test_cubes-3.scad)"  -D LABEL1=1 -D LABEL2=2 -D LABEL3=3
#
#	  "${APP_STR%}" -DLABEL1=DEPTH=$depth -DLABEL2=GAP=$gap -DLABEL3=JOIN=$join -o cube$depth$gap$join.stl "$(cygpath -w ./test_cubes-3.scad)" 
	  "${APP_STR%}" -o cube$depth\_$gap\_$join.stl "$(cygpath -w ./test_cubes-6.scad)" -D LABEL1=$depth -D LABEL2=$gap -D LABEL3=\"$join\"  
    done
  done
done
#_EOF_