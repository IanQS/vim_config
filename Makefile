# the compiler: gcc for C program, define as g++ for C++
CXX = g++

# compiler flags:
CXXFLAGS= -Wall -Wextra -pedantic -Werror -Wuninitialized
LDFLAGS= 
SOURCES=$(wildcard *.cpp)
OBJ=$(SOURCES:.cpp=.o)


prog: $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJ) myprog
