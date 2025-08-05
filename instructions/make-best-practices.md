# Makefile Best Practices

A comprehensive guide to writing clean, maintainable, and efficient Makefiles based on the GNU Make standard.

## Core Principles

### 1. Use Tabs, Not Spaces
**Critical**: Commands in recipes MUST be indented with TAB characters, not spaces.
```makefile
# CORRECT
target:
    command  # This is a TAB

# WRONG
target:
    command  # These are spaces - will fail!
```

### 2. Variable Assignment Best Practices

#### Use `:=` for Simply Expanded Variables (Recommended)
```makefile
# Simply expanded - evaluated once when defined
CC := gcc
CFLAGS := -Wall -O2
OBJECTS := main.o utils.o
```

#### Use `=` for Recursive Variables (Use Sparingly)
```makefile
# Recursive - evaluated each time it's used
FILES = $(wildcard *.c)  # Updates if new .c files are added
```

#### Use `?=` for Default Values
```makefile
# Only sets if not already defined
PREFIX ?= /usr/local
CC ?= gcc
```

#### Use `+=` to Append
```makefile
CFLAGS := -Wall
CFLAGS += -O2  # Now CFLAGS = "-Wall -O2"
```

### 3. Target Organization

#### Always Have an `all` Target First
```makefile
# First target is the default when running 'make' without arguments
all: program documentation

program: main.o utils.o
    $(CC) $^ -o $@

documentation:
    doxygen
```

#### Use `.PHONY` for Non-File Targets
```makefile
.PHONY: all clean test install

clean:
    rm -f *.o $(TARGET)

test:
    ./run_tests.sh
```

### 4. Use Automatic Variables

```makefile
# Essential automatic variables
target: prereq1 prereq2
    echo $@   # target name
    echo $<   # first prerequisite
    echo $^   # all prerequisites
    echo $?   # prerequisites newer than target
```

### 5. Pattern Rules and Static Pattern Rules

#### Pattern Rules for Generic Compilation
```makefile
# Generic rule for all .c to .o conversions
%.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@
```

#### Static Pattern Rules for Specific Sets
```makefile
OBJECTS = main.o utils.o parser.o

# Only applies to files in $(OBJECTS)
$(OBJECTS): %.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@
```

### 6. Dependency Management

#### Automatic Dependency Generation
```makefile
# Generate .d files with dependency information
DEPS := $(OBJECTS:.o=.d)

# Include compiler-generated dependencies
-include $(DEPS)

# Compile with dependency generation
%.o: %.c
    $(CC) $(CFLAGS) -MMD -MP -c $< -o $@
```

### 7. Error Handling

#### Use `.DELETE_ON_ERROR`
```makefile
# Delete target files when a recipe fails
.DELETE_ON_ERROR:
```

#### Ignore Errors When Appropriate
```makefile
clean:
    # The - prefix ignores errors from this command
    -rm -f *.o
    -rm -f $(TARGET)
```

### 8. Directory Structure

#### Handle Build Directories Properly
```makefile
BUILD_DIR := build
SRC_DIR := src

# Create directory before building into it
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
    @mkdir -p $(dir $@)
    $(CC) $(CFLAGS) -c $< -o $@
```

### 9. Command Echoing

#### Control Output Verbosity
```makefile
# Suppress command echo with @
quiet-target:
    @echo "Building..."
    @$(CC) $(CFLAGS) -c file.c

# Or use a verbosity variable
ifeq ($(V),1)
    Q =
else
    Q = @
endif

target:
    $(Q)$(CC) $(CFLAGS) -c file.c
```

### 10. Shell Usage

#### Each Line Runs in a New Shell
```makefile
# WRONG - cd doesn't affect next line
wrong:
    cd subdir
    make

# CORRECT - use semicolons or backslashes
correct:
    cd subdir && make

# Or use backslashes for readability
also-correct:
    cd subdir && \
    make
```

#### Use `$$` for Shell Variables
```makefile
target:
    for file in *.c; do \
        echo "Processing $$file"; \
    done
```

## Advanced Best Practices

### 1. Use Functions Effectively

#### Text Manipulation
```makefile
# Remove directory and suffix transformations
SOURCES := $(wildcard src/*.c)
BASENAMES := $(notdir $(basename $(SOURCES)))
```

#### Conditional Functions
```makefile
# Use call for reusable "functions"
define compile-rule
$(1): $(2)
    $$(CC) $$(CFLAGS) -c $(2) -o $(1)
endef

$(eval $(call compile-rule,main.o,main.c))
```

### 2. Cross-Platform Compatibility

```makefile
# Detect OS for platform-specific settings
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    CFLAGS += -D LINUX
endif
ifeq ($(UNAME_S),Darwin)
    CFLAGS += -D OSX
endif
```

### 3. Include Guards

```makefile
# Prevent multiple includes
ifndef COMMON_MK
COMMON_MK := 1

# Common definitions here

endif # COMMON_MK
```

### 4. Parallel Execution Safety

```makefile
# Ensure targets can be built in parallel
.NOTPARALLEL: clean  # Don't parallelize clean

# Use order-only prerequisites for directories
$(OBJECTS): | $(BUILD_DIR)

$(BUILD_DIR):
    mkdir -p $@
```

### 5. Export Variables Judiciously

```makefile
# Export for sub-makes
export CC CFLAGS

# Or export everything (use sparingly)
.EXPORT_ALL_VARIABLES:
```

## Common Patterns

### Standard C/C++ Project Template

```makefile
# Project settings
TARGET := myprogram
BUILD_DIR := build
SRC_DIRS := src

# Compiler settings
CC := gcc
CXX := g++
CFLAGS := -Wall -Wextra -O2
CXXFLAGS := $(CFLAGS) -std=c++17

# Find sources
SRCS := $(shell find $(SRC_DIRS) -name '*.cpp' -or -name '*.c')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

# Include paths
INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

# Compiler flags for dependency generation
CPPFLAGS := $(INC_FLAGS) -MMD -MP

# Main target
$(BUILD_DIR)/$(TARGET): $(OBJS)
    $(CXX) $(OBJS) -o $@ $(LDFLAGS)

# Build rules
$(BUILD_DIR)/%.c.o: %.c
    @mkdir -p $(dir $@)
    $(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.cpp.o: %.cpp
    @mkdir -p $(dir $@)
    $(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
    rm -rf $(BUILD_DIR)

# Include dependencies
-include $(DEPS)
```

### Library Project Template

```makefile
# Library settings
LIB_NAME := mylib
VERSION := 1.0.0

# Build both static and shared libraries
STATIC_LIB := lib$(LIB_NAME).a
SHARED_LIB := lib$(LIB_NAME).so.$(VERSION)

# Installation directories
PREFIX ?= /usr/local
INCLUDE_DIR := $(PREFIX)/include
LIB_DIR := $(PREFIX)/lib

# Build rules
all: $(STATIC_LIB) $(SHARED_LIB)

$(STATIC_LIB): $(OBJS)
    $(AR) rcs $@ $^

$(SHARED_LIB): $(OBJS)
    $(CC) -shared -Wl,-soname,lib$(LIB_NAME).so.1 -o $@ $^

.PHONY: install
install: all
    install -d $(INCLUDE_DIR) $(LIB_DIR)
    install -m 644 include/*.h $(INCLUDE_DIR)
    install -m 755 $(SHARED_LIB) $(LIB_DIR)
    install -m 644 $(STATIC_LIB) $(LIB_DIR)
    ldconfig
```

## Common Pitfalls to Avoid

### 1. Spaces in Variable Assignments
```makefile
# WRONG - includes trailing spaces
VAR = value   

# CORRECT
VAR = value
```

### 2. Using Wildcards in Variable Definitions
```makefile
# WRONG - * doesn't expand in simple assignment
OBJS := *.o

# CORRECT
OBJS := $(wildcard *.o)
```

### 3. Not Using PHONY Targets
```makefile
# WRONG - if a file named 'clean' exists, target won't run
clean:
    rm -f *.o

# CORRECT
.PHONY: clean
clean:
    rm -f *.o
```

### 4. Shell Loop Pitfalls
```makefile
# WRONG - each line in new shell
wrong:
    export VAR=value
    echo $$VAR  # Won't see the exported value

# CORRECT
correct:
    export VAR=value; echo $$VAR
```

### 5. Not Quoting Shell Variables
```makefile
# WRONG - breaks with spaces in filenames
wrong:
    for f in $(FILES); do cp $$f backup/; done

# CORRECT
correct:
    for f in $(FILES); do cp "$$f" backup/; done
```

## Performance Tips

### 1. Use Parallel Builds
```bash
# Run with multiple jobs
make -j$(nproc)  # Linux
make -j$(sysctl -n hw.ncpu)  # macOS
```

### 2. Avoid Recursive Make When Possible
```makefile
# Instead of recursive make
all:
    $(MAKE) -C subdir

# Consider including submakefiles
include subdir/module.mk
```

### 3. Cache Expensive Operations
```makefile
# Cache shell calls
GIT_VERSION := $(shell git describe --always --dirty 2>/dev/null)

# Don't call shell in recipes when not needed
SOURCES := $(wildcard *.c)  # Evaluated once
```

### 4. Use Grouped Targets (GNU Make 4.3+)
```makefile
# Generate multiple outputs atomically
parser.c parser.h &: parser.y
    yacc -d $<
```

## Debugging Makefiles

### 1. Print Variable Values
```makefile
print-%:
    @echo '$*=$($*)'

# Usage: make print-CFLAGS
```

### 2. Use Warning/Info Functions
```makefile
$(info Building $(TARGET)...)
$(warning DEPRECATED: Use new target name)
$(error Configuration error: CC not set)
```

### 3. Debug Flags
```bash
make -n  # Dry run
make -d  # Debug output
make -p  # Print database
make --trace  # Trace execution (GNU Make 4.0+)
```

## Modern Make Features (GNU Make 4.x)

### 1. Grouped Targets
```makefile
# Multiple outputs from single recipe
foo bar baz &: source
    generate-all $< $@
```

### 2. .ONESHELL
```makefile
# Run all recipe lines in single shell
.ONESHELL:
deploy:
    cd /path/to/deployment
    git pull
    make install
```

### 3. Improved Functions
```makefile
# File functions
content := $(file <input.txt)
$(file >output.txt,$(content))
```

## Summary Checklist

- [ ] Use tabs for recipes, not spaces
- [ ] First target is the default (usually `all`)
- [ ] Mark non-file targets as `.PHONY`
- [ ] Use `:=` for variable assignment unless recursion needed
- [ ] Use automatic variables (`$@`, `$<`, `$^`)
- [ ] Enable `.DELETE_ON_ERROR`
- [ ] Generate dependencies automatically with `-MMD -MP`
- [ ] Quote shell variables and handle spaces in filenames
- [ ] Test parallel builds with `make -j`
- [ ] Include clear `clean` and `install` targets
- [ ] Document complex rules with comments
- [ ] Use `$(MAKE)` for recursive invocations
