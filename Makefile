all: build run

build:
	gfortran sin.f90 -o sin -cpp

build-fast:
	gfortran sin.f90 -o fsin -fopenmp -cpp

run:
	./sin

run-fast:
	./fsin
