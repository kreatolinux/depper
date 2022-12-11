.PHONY: all main clean

all: main

main:
				nim c -d:release -o=depper src/main.nim

clean:
				rm -f depper
