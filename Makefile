

.PHONY: all
all: make_package compile

.PHONY: make_package
make_package: package_build package_library



.PHONY: package_build
package_build:
	mkdir -p build/

.PHONY: package_library
package_library:
	mkdir -p build/include
	mkdir -p build/lib
	mkdir -p build/src

.PHONY: compile
compile:
	cc -Wall -Wextra -Werror -pedantic -std=c11 -fPIC -shared -Wl,-soname,librandomvalue.so.1 -o librandomvalue.so.1.0 src/random_value.c
	cc -Wall -Wextra -Werror -pedantic -std=c11 -c -o librandomvalue.o src/random_value.c
	ar rcs librandomvalue.a librandomvalue.o
	chmod 644 librandomvalue.a
	rm -f librandomvalue.o
	ln -sf librandomvalue.so.1.0 librandomvalue.so
	install -m 644 src/random_value.c build/src
	install -m 644 src/random_value.h build/include
	mv librandomvalue.so.1.0 librandomvalue.so librandomvalue.a build/lib

.PHONY: install
install:
	mkdir -p /usr/local/src /usr/local/lib /usr/local/include 
	cp -R build/include build/lib build/src /usr/local
	ldconfig /usr/local/lib

FOLDER_INCLUDE = /usr/local/include/
FOLDER_SRC = /usr/local/src/
FOLDER_LIB = /usr/local/lib/

POST_CLEAN = $(addprefix $(FOLDER_INCLUDE), random_value*) \
			 $(addprefix $(FOLDER_SRC), random_value*) \
			 $(addprefix $(FOLDER_LIB), librandomvalue*) \

.PHONY: uninstall
uninstall:
	rm -f $(POST_CLEAN)

# rm -f /usr/local/include/randomvalue.h
# rm -f /usr/local/src/randomvalue.c
# rm -f /usr/local/lib/librandomvalue.so /usr/local/lib/librandomvalue.so.1 /usr/local/lib/librandomvalue.so.1.0 /usr/local/lib/librandomvalue.a

FOLDER_BUILD = build/

.PHONY: clean
clean: uninstall
	rm -rf $(FOLDER_BUILD)
	rm -f test

.PHONY: version
version:
	@echo 1.0

.PHONY: run
run:
	@gcc -o test tests/test.c -lrandomvalue 
	@./test
