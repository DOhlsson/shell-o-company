CC = gcc

CFLAGS  = -g -Wall -Wextra -Werror -O2

# the build target executable:
TARGET = shell

all: $(TARGET)

$(TARGET): $(TARGET).c 
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean: 
	$(RM) $(TARGET)