ifeq ($(OS), Windows_NT)
	# TODO: change program name
	PROG = <program>.exe
else
	PROG = <program>
endif

SRC = src
TESTS = tests
COLLECTIONS = -collection:src=$(SRC) -collection:lib=lib

CC = odin
BUILD_DIR = build
CFLAGS = -out:$(BUILD_DIR)/$(PROG) -strict-style -vet-semicolon -vet-cast -vet-using-param $(COLLECTIONS)

all: release

release: CFLAGS += -vet-unused -o:speed -microarch:native
release: $(PROG)

debug: CFLAGS += -debug -o:none
debug: $(PROG)

test: CFLAGS += -define:ODIN_TEST_LOG_LEVEL=warning -define:ODIN_TEST_FANCY=false -define:ODIN_TEST_SHORT_LOGS=true -debug -keep-executable
test:
	@mkdir -p $(BUILD_DIR)
	$(CC) test $(TESTS) $(CFLAGS)

$(PROG):
	@mkdir -p $(BUILD_DIR)
	$(CC) build $(SRC) $(CFLAGS)

run: debug
	./$(BUILD_DIR)/$(PROG)

check: CFLAGS := $(filter-out -out:$(BUILD_DIR)/$(PROG),$(CFLAGS))
check:
	$(CC) check $(SRC) $(CFLAGS) -debug

clean:
	-@rm -r $(BUILD_DIR)

.PHONY: release debug clean run test check
