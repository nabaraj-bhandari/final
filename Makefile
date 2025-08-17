# Detect OS (Windows,Linux)
ifeq ($(OS),Windows_NT)
    TARGET = program.exe
    SRC = src/*.cpp
    INCLUDE = -I"SFML-3.0.0/include"
    LIBRARY = -L"SFML-3.0.0/lib"
    LIBS = -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lwinmm -lgdi32
    CFLAGS = -std=c++17 $(INCLUDE) -DSFML_STATIC
    LFLAGS = $(LIBRARY) $(LIBS)
    RM = del /Q
else
    TARGET = program
    SRC = src/*.cpp
    CFLAGS = -std=c++17
    LFLAGS = -lsfml-graphics -lsfml-window -lsfml-system
    RM = rm -f
endif

all:
	g++ $(CFLAGS) $(SRC) -o $(TARGET) $(LFLAGS)

run: all
	./$(TARGET)

clean:
	$(RM) $(TARGET)

