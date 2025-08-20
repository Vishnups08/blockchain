#!/bin/bash

# Blockchain Java Examples - Auto Download and Run Script
# This script downloads all Java files and runs them automatically

echo "🚀 Blockchain Java Examples - Auto Setup and Run"
echo "================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Java is installed
check_java() {
    if ! command -v java &> /dev/null; then
        print_error "Java is not installed or not in PATH"
        echo "Please install Java 8 or higher from:"
        echo "  - Oracle: https://www.oracle.com/java/technologies/downloads/"
        echo "  - OpenJDK: https://openjdk.java.net/"
        exit 1
    fi
    
    JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
    if [ "$JAVA_VERSION" -lt 8 ]; then
        print_error "Java version $JAVA_VERSION detected. Java 8 or higher is required."
        exit 1
    fi
    
    print_success "Java $(java -version 2>&1 | head -n 1 | cut -d'"' -f2) detected"
}

# Download Java files
download_files() {
    print_status "Downloading Java blockchain examples..."
    
    # List of files to download (you'll need to update these URLs with your actual repository)
    FILES=(
        "five.java"
        "three.java" 
        "four.java"
        "two.java"
        "one.java"
    )
    
    for file in "${FILES[@]}"; do
        if [ -f "$file" ]; then
            print_warning "File $file already exists, skipping download"
        else
            print_status "Downloading $file..."
            # Note: You'll need to replace this URL with your actual repository URL
            # curl -O "https://raw.githubusercontent.com/yourusername/blockchain-java/main/$file"
            print_warning "Please manually download $file or update the script with correct URLs"
        fi
    done
}

# Compile Java files
compile_java() {
    print_status "Compiling Java files..."
    
    if javac *.java; then
        print_success "All Java files compiled successfully"
    else
        print_error "Compilation failed"
        exit 1
    fi
}

# Run all examples
run_examples() {
    echo ""
    echo "🎯 Running Blockchain Examples"
    echo "=============================="
    
    # Run each program with a delay
    PROGRAMS=(
        "five"
        "three"
        "four" 
        "two"
        "one"
    )
    
    for program in "${PROGRAMS[@]}"; do
        if [ -f "$program.class" ]; then
            echo ""
            echo "🔹 Running $program..."
            echo "----------------------------------------"
            java "$program"
            echo "----------------------------------------"
            sleep 2
        else
            print_warning "Class file for $program not found"
        fi
    done
}

# Main execution
main() {
    check_java
    download_files
    compile_java
    run_examples
    
    echo ""
    print_success "All blockchain examples completed!"
    echo ""
    echo "📁 Generated files:"
    ls -la *.class 2>/dev/null || echo "No class files found"
    echo ""
    echo "🧹 To clean up generated files, run: make clean"
}

# Run main function
main "$@" 