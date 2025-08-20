#!/bin/bash
# Download all blockchain Java examples
# Usage: ./download-all.sh [repository-url]

# Default GitHub repository URL (UPDATE THIS WITH YOUR ACTUAL REPO)
REPO_URL=${1:-"https://raw.githubusercontent.com/Vishnups08/blockchain/main"}

echo "📥 Downloading Blockchain Java Examples from: $REPO_URL"
echo "=================================================="
echo ""
echo "⚠️  IMPORTANT: Before using this script, you need to:"
echo "   1. Create a GitHub repository named 'blockchain-java'"
echo "   2. Upload all your Java files to it"
echo "   3. Update the REPO_URL in this script with your actual GitHub username"
echo ""

# List of files to download
FILES=(
    "five.java"
    "three.java"
    "four.java"
    "two.java"
    "one.java"
    "README.md"
    "Makefile"
    "run.sh"
    "run.bat"
)

# Download each file
for file in "${FILES[@]}"; do
    echo "Downloading $file..."
    if curl -f -O "$REPO_URL/$file"; then
        echo "✅ Downloaded $file"
    else
        echo "❌ Failed to download $file"
        echo "   Make sure the repository URL is correct and the file exists"
    fi
done

echo ""
echo "🎯 To run all examples:"
echo "  Unix/Linux/Mac: ./run.sh"
echo "  Windows: run.bat"
echo "  Or use: make run"
echo ""
echo "📚 See README.md for detailed instructions"
echo ""
echo "🔧 To set up your own repository:"
echo "   1. Go to github.com and create a new repository"
echo "   2. Name it 'blockchain-java'"
echo "   3. Upload all your .java files"
echo "   4. Update the REPO_URL variable in this script"
echo "   5. Share the updated script with others" 