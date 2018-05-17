CC = gcc

CFLAGS  = -g -Wall -Wextra -Werror -O2
LDFLAGS = 
OBJS = dcoreutil.o shell.o

# the build target executable:
TARGET = shell

.PHONY: clean all

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJS)

$(OBJS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean: 
	$(RM) $(TARGET)
	$(RM) $(OBJS)
