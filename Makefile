CC=g++
CFLAGS= -Wall -Wextra -pedantic -Werror -Wuninitialized
LDFLAGS= -Wall -Wextra -pedantic -Werror -Wuninitialized
SOURCES= hello.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=main

all: $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@


