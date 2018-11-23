LIBRARY = reminder.so
EXECUTABLE = main

SRC_LIBRARY = reminder.cpp
SRC_EXECUTABLE = main.cpp
HEADER = reminder.h
OBJ_LIBRARY = $(SRC_LIBRARY:.cpp=.lib.o)
OBJ_EXECUTABLE = $(SRC_EXECUTABLE:.cpp=.exec.o)

CC = g++
CC_FLAGS = -Wall -Wextra -Werror

.PHONY: all clean clean_temps re

all: $(LIBRARY) $(EXECUTABLE)


$(LIBRARY): $(OBJ_LIBRARY)
	$(CC) -shared $^ -o $@

%.lib.o: %.cpp $(HEADER)
	$(CC) -c $(CC_FLAGS) -fpic $< -o $@


$(EXECUTABLE): $(OBJ_EXECUTABLE) $(HEADER) $(LIBRARY)
	$(CC) $< -L . $(LIBRARY) -o $@

%.exec.o: %.cpp $(HEADER)
	$(CC) -c $(CC_FLAGS) $< -o $@


clean_temps:
	rm -f $(OBJ_LIBRARY) $(OBJ_EXECUTABLE)

clean: clean_temps
	rm -f $(LIBRARY) $(EXECUTABLE)

re: clean all