package Task1;

import java.util.Date;

// Transaction class for each of the Record in TRANSACTIONS table
public class Transaction {
    // Transaction ID for each of the Transaction
    private final int T_ID;
    // Transaction Date for each of the Transaction
    private final Date T_DATE;
    // Account ID for each of the Transaction
    private final int A_ID;
    // Transaction Amount for each of the Transaction
    private final double T_AMOUNT;
    // Transaction Type for each of the Transaction
    private final String T_TYPE;


    // Constructor for Transaction class
    public Transaction(int T_ID, Date T_DATE, int A_ID, double T_AMOUNT, String T_TYPE) {
        this.T_ID = T_ID;
        this.T_DATE = T_DATE;
        this.A_ID = A_ID;
        this.T_AMOUNT = T_AMOUNT;
        this.T_TYPE = T_TYPE;
    }

    // Getter methods for Transaction class
    public int getT_ID() {
        return T_ID;
    }

    public int getA_ID() {
        return A_ID;
    }

    public String getT_TYPE() {
        return T_TYPE;
    }

    public double getT_AMOUNT() {
        return T_AMOUNT;
    }

    public Date getT_DATE() {
        return T_DATE;
    }

    // toString method for Transaction class
    public String toString() {
        return "Transaction ID: " + T_ID + "\n" +
                "Transaction Date: " + T_DATE + "\n" +
                "Account ID: " + A_ID + "\n" +
                "Transaction Amount: " + T_AMOUNT + "\n" +
                "Transaction Type: " + T_TYPE + "\n";
    }

}

