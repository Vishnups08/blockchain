import java.security.*;
import java.util.Base64;

public class four {
    public static void main(String[] args) throws Exception {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(2048);
        KeyPair pair = keyGen.generateKeyPair();
        PrivateKey privateKey = pair.getPrivate();
        PublicKey publicKey = pair.getPublic();

        String transaction = "Sender: Alice, Receiver: Bob, Amount: 100";
        System.out.println("Original Transaction:\n" + transaction);

        Signature sign = Signature.getInstance("SHA256withRSA");
        sign.initSign(privateKey);
        sign.update(transaction.getBytes("UTF-8"));
        byte[] signatureBytes = sign.sign();
        String signature = Base64.getEncoder().encodeToString(signatureBytes);
        System.out.println("\nDigital Signature:\n" + signature);

        Signature verifySign = Signature.getInstance("SHA256withRSA");
        verifySign.initVerify(publicKey);
        verifySign.update(transaction.getBytes("UTF-8"));
        boolean isVerified = verifySign.verify(signatureBytes);
        System.out.println("\nIs Signature Verified? " + isVerified);
    }
} 