CFLAGS = -O2 -Wall -D_POSIX_C_SOURCE=200112
TARGET = linus_stress


all: $(TARGET)


$(TARGET): linus_stress.c
	$(CC) $(CFLAGS) $^ -o $@


clean:
	$(RM) $(TARGET)
