import java.util.ArrayList;
import java.util.Date;
import java.security.MessageDigest;

class Block {
    public String hash;
    public String previousHash;
    private String data;
    private long timeStamp;
    private int nonce;

    public Block(String data, String previousHash) {
        this.data = data;
        this.previousHash = previousHash;
        this.timeStamp = new Date().getTime();
        this.hash = calculateHash();
    }

    public String calculateHash() {
        String input = previousHash + Long.toString(timeStamp) + Integer.toString(nonce) + data;
        return applySha256(input);
    }

    public void mineBlock(int difficulty) {
        String target = new String(new char[difficulty]).replace('\0', '0');
        while (!hash.substring(0, difficulty).equals(target)) {
            nonce++;
            hash = calculateHash();
        }
        System.out.println("Block Mined: " + hash);
    }

    public static String applySha256(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(input.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();

            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

public class three {
    public static ArrayList<Block> blockchain = new ArrayList<>();
    public static int difficulty = 4;

    public static void main(String[] args) {
        System.out.println("Mining block 1...");
        Block block1 = new Block("First Block", "0");
        block1.mineBlock(difficulty);
        blockchain.add(block1);

        System.out.println("Mining block 2...");
        Block block2 = new Block("Second Block", blockchain.get(blockchain.size() - 1).hash);
        block2.mineBlock(difficulty);
        blockchain.add(block2);

        System.out.println("Mining block 3...");
        Block block3 = new Block("Third Block", blockchain.get(blockchain.size() - 1).hash);
        block3.mineBlock(difficulty);
        blockchain.add(block3);

        System.out.println("\nBlockchain is valid: " + isChainValid());

        System.out.println("\nBlockchain contents:");
        for (Block block : blockchain) {
            System.out.println("Hash: " + block.hash);
            System.out.println("Previous Hash: " + block.previousHash);
            System.out.println("-------------------------");
        }
    }

    public static boolean isChainValid() {
        for (int i = 1; i < blockchain.size(); i++) {
            Block currentBlock = blockchain.get(i);
            Block previousBlock = blockchain.get(i - 1);

            if (!currentBlock.hash.equals(currentBlock.calculateHash())) {
                return false;
            }

            if (!currentBlock.previousHash.equals(previousBlock.hash)) {
                return false;
            }
        }
        return true;
    }
} 