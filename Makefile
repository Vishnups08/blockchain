# Blockchain Java Examples Makefile
# Provides easy commands to compile and run all examples

# Java compiler
JAVAC = javac
JAVA = java

# Source files
SOURCES = five.java three.java four.java two.java one.java

# Class files (will be generated)
CLASSES = $(SOURCES:.java=.class)

# Default target
all: compile

# Compile all Java files
compile: $(CLASSES)
	@echo "✅ All Java files compiled successfully!"

# Rule to compile .java to .class
%.class: %.java
	@echo "🔨 Compiling $<..."
	@$(JAVAC) $<

# Run all examples
run: compile
	@echo ""
	@echo "🚀 Running all blockchain examples..."
	@echo "====================================="
	@$(MAKE) run-wallet
	@$(MAKE) run-blockchain
	@$(MAKE) run-transaction
	@$(MAKE) run-sha256
	@$(MAKE) run-rsa

# Run individual programs
run-wallet: compile
	@echo ""
	@echo "🔹 Running five (BlockchainWallet)..."
	@echo "----------------------------------------"
	@$(JAVA) five
	@echo "----------------------------------------"

run-blockchain: compile
	@echo ""
	@echo "🔹 Running three (SimpleBlockchain)..."
	@echo "----------------------------------------"
	@$(JAVA) three
	@echo "----------------------------------------"

run-transaction: compile
	@echo ""
	@echo "🔹 Running four (TransactionVerification)..."
	@echo "----------------------------------------"
	@$(JAVA) four
	@echo "----------------------------------------"

run-sha256: compile
	@echo ""
	@echo "🔹 Running two (SHA256Example)..."
	@echo "----------------------------------------"
	@$(JAVA) two
	@echo "----------------------------------------"

run-rsa: compile
	@echo ""
	@echo "🔹 Running one (RSADemo)..."
	@echo "----------------------------------------"
	@$(JAVA) one
	@echo "----------------------------------------"

# Clean up generated files
clean:
	@echo "🧹 Cleaning up generated files..."
	@rm -f *.class
	@echo "✅ Cleanup complete!"

# Check Java installation
check-java:
	@echo "🔍 Checking Java installation..."
	@if command -v java >/dev/null 2>&1; then \
		echo "✅ Java found: $$(java -version 2>&1 | head -n 1)"; \
	else \
		echo "❌ Java not found. Please install Java 8 or higher."; \
		exit 1; \
	fi

# Show help
help:
	@echo "Blockchain Java Examples - Available Commands:"
	@echo ""
	@echo "  make compile     - Compile all Java files"
	@echo "  make run         - Compile and run all examples"
	@echo "  make run-wallet  - Run five (BlockchainWallet) example"
	@echo "  make run-blockchain - Run three (SimpleBlockchain) example"
	@echo "  make run-transaction - Run four (TransactionVerification) example"
	@echo "  make run-sha256  - Run two (SHA256Example)"
	@echo "  make run-rsa     - Run one (RSADemo)"
	@echo "  make clean       - Remove all generated .class files"
	@echo "  make check-java  - Check if Java is installed"
	@echo "  make help        - Show this help message"
	@echo ""
	@echo "Quick start: make run"

# Phony targets (don't represent actual files)
.PHONY: all compile run run-wallet run-blockchain run-transaction run-sha256 run-rsa clean check-java help 