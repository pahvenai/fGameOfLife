CC=gcc
FC=gfortran
FCFLAGS=-Wall

EXE=game
OBJ=readwritemodule.o game.o


all: $(EXE)

readwritemodule.o: readwritemodule.f90
game.o: readwritemodule.f90 game.f90

$(EXE): $(OBJ)
	$(FC) $(FCFLAGS) $(OBJ) -o $@ 

%.o: %.f90
	$(FC) $(FCFLAGS) -c $< -o $@

clean:
	-/bin/rm -f $(EXE)  a.out *.o *.mod
