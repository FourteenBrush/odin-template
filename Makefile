rwildcard = $(wildcard $1) $(foreach d,$1,$(call rwildcard,$(addsuffix /$(notdir $d),$(wildcard $(dir $d)*))))

PROG = <program name goes here>
SRC = src
SOURCE_FILES = $(call rwildcard,$(SRC)/*.odin)
TESTS = tests

CC = odin
CFLAGS = -out:$(PROG) -strict-style -vet-semicolon -vet-cast -vet-using-param

all: release

release: CFLAGS += -vet-unused -o:speed -microarch:native
release: $(PROG)

debug: CFLAGS += -debug -o:none
debug: $(PROG)

test: CFLAGS += -define:ODIN_TEST_LOG_LEVEL=warning -debug
test: $(SOURCE_FILES)
	$(CC) test $(TESTS) $(CFLAGS)

$(PROG): $(SOURCE_FILES)
	$(CC) build $(SRC) $(CFLAGS)

run: debug
	./$(PROG)

check: CFLAGS := $(filter-out -out:$(PROG),$(CFLAGS))
check:
	$(CC) check $(SRC) $(CFLAGS) -debug

clean:
	-@rm $(PROG) 2>/dev/null

.PHONY: release debug clean run test check
