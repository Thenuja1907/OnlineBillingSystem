package model;

public class Bill {
    private int id;
    private Customer customer;
    private int unitsConsumed;
    private double ratePerUnit;
    private double totalAmount;
    private double tax;
    private double grandTotal;

    public Bill(Customer customer) {
        this.customer = customer;
        this.unitsConsumed = customer.getUnitsConsumed();
        this.totalAmount = calculateTotal();
        this.tax = totalAmount * 0.10;
        this.grandTotal = totalAmount + tax;
    }

    private double calculateTotal() {
        int units = unitsConsumed;
        double total = 0;

        if (units <= 100) {
            ratePerUnit = 3;
            total = units * ratePerUnit;
        } else if (units <= 200) {
            ratePerUnit = 5;
            total = (100 * 3) + ((units - 100) * ratePerUnit);
        } else {
            ratePerUnit = 7;
            total = (100 * 3) + (100 * 5) + ((units - 200) * ratePerUnit);
        }

        return total;
    }

    // Getters
    public Customer getCustomer() {
        return customer;
    }

    public int getUnitsConsumed() {
        return unitsConsumed;
    }

    public double getRatePerUnit() {
        return ratePerUnit;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public double getTax() {
        return tax;
    }

    public double getGrandTotal() {
        return grandTotal;
    }
}
