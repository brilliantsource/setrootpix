.POSIX:

# Paths
INSTALL_DIR = ${HOME}/.local/bin

CC = gcc
CFLAGS = -Wall -Wextra -O2 -pipe
LDFLAGS = -lX11

SRC = setrootpix.c
OBJ = ${SRC:.c=.o}
BIN = ${OBJ:.o=}

all: ${BIN}

${BIN}: ${OBJ}
	${CC} -o $@ $< ${LDFLAGS}

${OBJ}: ${SRC}
	${CC} -c ${CFLAGS} $<

clean:
	rm -f ${BIN} ${OBJ}

install: all
	mkdir -p ${INSTALL_DIR}
	cp -f ${BIN} ${INSTALL_DIR}

.PHONY: all clean install
