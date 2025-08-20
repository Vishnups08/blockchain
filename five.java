import java.security.*;
import java.security.spec.ECGenParameterSpec;
import java.util.Base64;

public class five {
    public static void main(String[] args) {
        try {
            int aliceBalance = 100, bobBalance = 50;
            System.out.println("=== WALLET BALANCES BEFORE TRANSACTION ===");
            System.out.println("Alice's Balance: " + aliceBalance + " dollars");
            System.out.println("Bob's Balance: " + bobBalance + " dollars\n");
            
            KeyPairGenerator keyGen = KeyPairGenerator.getInstance("EC");
            keyGen.initialize(new ECGenParameterSpec("secp256r1"));
            KeyPair keyPair = keyGen.generateKeyPair();
            
            System.out.println("Public Key:\n" + Base64.getEncoder().encodeToString(keyPair.getPublic().getEncoded()));
            System.out.println("Private Key:\n" + Base64.getEncoder().encodeToString(keyPair.getPrivate().getEncoded()));
            
            int transactionAmount = 10;
            String transactionText = "Send " + transactionAmount + " coins to Alice";
            byte[] transaction = transactionText.getBytes("UTF-8");
            System.out.println("\nTransaction: " + transactionText);
            
            Signature ecdsa = Signature.getInstance("SHA256withECDSA");
            ecdsa.initSign(keyPair.getPrivate());
            ecdsa.update(transaction);
            String signature = Base64.getEncoder().encodeToString(ecdsa.sign());
            System.out.println("Signature (Base64): " + signature);
            
            Signature verifyEcdsa = Signature.getInstance("SHA256withECDSA");
            verifyEcdsa.initVerify(keyPair.getPublic());
            verifyEcdsa.update(transaction);
            
            if (verifyEcdsa.verify(Base64.getDecoder().decode(signature))) {
                System.out.println("Signature Verified: True");
                aliceBalance += transactionAmount;
                bobBalance -= transactionAmount;
                System.out.println("\n=== WALLET BALANCES AFTER TRANSACTION ===");
                System.out.println("Alice's Balance: " + aliceBalance + " dollars");
                System.out.println("Bob's Balance: " + bobBalance + " dollars");
            } else {
                System.out.println("Signature Verified: False\nTransaction failed - balances unchanged");
            }
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
} 