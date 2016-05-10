CFLAGS = -O2 -Wall
TARGET = ipv6connect


all: $(TARGET)


$(TARGET): ipv6connect.c
	$(CC) $(CFLAGS) $^ -o $@ -lpthread


clean:
	$(RM) $(TARGET)
