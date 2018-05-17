CC = gcc

CFLAGS  = -g -Wall -Wextra -Werror -O2
LDFLAGS = 
OBJS = dcoreutil.o shell.o

# the build target executable:
TARGET = shell

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJS)

$(OBJS): %.o: %.c
	$(CC) -c $(CFLAGS) $<

#$(TARGET).o: $(TARGET).c 
#	$(CC) $(CFLAGS) -c $(TARGET).c

clean: 
	$(RM) $(TARGET)
	$(RM) $(OBJS).o
