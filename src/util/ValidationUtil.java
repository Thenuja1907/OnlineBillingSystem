package util;

public class ValidationUtil {

    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("\\d{10}");
    }

    public static boolean isValidUnits(String units) {
        try {
            int val = Integer.parseInt(units);
            return val >= 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isValidPrice(String price) {
        try {
            double val = Double.parseDouble(price);
            return val >= 0.0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isNotEmpty(String value) {
        return value != null && !value.trim().isEmpty();
    }
}
