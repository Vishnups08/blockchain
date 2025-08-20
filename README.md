# Blockchain Java Examples

This repository contains 5 Java programs demonstrating various blockchain concepts:

## Programs Included

1. **BlockchainWallet.java** - Demonstrates wallet creation, transaction signing, and balance management using ECDSA
2. **SimpleBlockchain.java** - A complete blockchain implementation with mining and validation
3. **TransactionVerification.java** - Shows RSA-based transaction signing and verification
4. **SHA256Example.java** - Demonstrates SHA-256 hashing algorithm
5. **RSADemo.java** - RSA encryption and decryption example

## Quick Start

### Prerequisites
- Java 8 or higher
- Git (optional, for cloning)

### Method 1: Download and Run (Recommended)

#### For Unix/Linux/Mac:
```bash
# Download the run script
curl -O https://raw.githubusercontent.com/yourusername/blockchain-java/main/run.sh
chmod +x run.sh

# Run all examples
./run.sh
```

#### For Windows:
```cmd
# Download the run script
curl -O https://raw.githubusercontent.com/yourusername/blockchain-java/main/run.bat

# Run all examples
run.bat
```

### Method 2: Manual Setup

1. **Download all Java files:**
   ```bash
   # Download individual files
   curl -O BlockchainWallet.java
   curl -O SimpleBlockchain.java
   curl -O TransactionVerification.java
   curl -O SHA256Example.java
   curl -O RSADemo.java
   ```

2. **Compile and run:**
   ```bash
   # Compile all Java files
   javac *.java
   
   # Run individual programs
   java BlockchainWallet
   java SimpleBlockchain
   java TransactionVerification
   java SHA256Example
   java RSADemo
   ```

### Method 3: Using Make (Unix/Linux/Mac)

```bash
# Download Makefile
curl -O https://raw.githubusercontent.com/yourusername/blockchain-java/main/Makefile

# Compile and run all
make all

# Run specific program
make run-wallet
make run-blockchain
make run-transaction
make run-sha256
make run-rsa
```

## Individual Program Descriptions

### BlockchainWallet.java
- Creates ECDSA key pairs
- Simulates wallet balances
- Signs and verifies transactions
- Updates balances after successful verification

### SimpleBlockchain.java
- Implements a complete blockchain
- Mines blocks with proof-of-work
- Validates blockchain integrity
- Shows block linking and hashing

### TransactionVerification.java
- Uses RSA for transaction signing
- Demonstrates digital signature verification
- Shows secure transaction processing

### SHA256Example.java
- Simple SHA-256 hashing demonstration
- Shows how blockchain hashing works
- Basic cryptographic hash function

### RSADemo.java
- RSA key pair generation
- Message encryption and decryption
- Public/private key cryptography

## Expected Output

Each program will show:
- Cryptographic operations in action
- Generated keys and signatures
- Transaction processing results
- Blockchain mining progress
- Verification results

## Troubleshooting

- **Java not found**: Install Java 8+ from [Oracle](https://www.oracle.com/java/technologies/downloads/) or [OpenJDK](https://openjdk.java.net/)
- **Compilation errors**: Ensure all files are in the same directory
- **Permission denied**: Make scripts executable with `chmod +x run.sh`

## Security Note

These are educational examples. For production use:
- Use proper key management
- Implement secure random number generation
- Follow security best practices
- Consider using established blockchain frameworks
