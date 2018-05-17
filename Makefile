CC = gcc

CFLAGS  = -g -Wall -Wextra -Werror -O2
OBJS = dcoreutil.o shell.o

# the build target executable:
TARGET = shell

all: $(TARGET)
#all: $(OBJS)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

$(OBJS): %.o: %.c
	$(CC) -c $(CFLAGS) $<

#$(TARGET).o: $(TARGET).c 
#	$(CC) $(CFLAGS) -c $(TARGET).c

clean: 
	$(RM) $(TARGET)
	$(RM) $(OBJS).o
