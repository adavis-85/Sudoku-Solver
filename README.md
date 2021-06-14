# Sudoku Solver

Sudoku is played on a 9 by 9 grid matrix.  There are three general rules to follow:

1.  The numbers 1 to 9 can only appear once each row.
2.  The numbers 1 to 9 can only appear once each column.
3.  The numbers 1 to 9 can only appear once each 3 by three grouping of which there are 9.

A good way to think of a sudoku puzzle is being a 9 by 9 matrix composed of 9 3 by 3 matrices.  Here it is solved using JuMP in Julia.
