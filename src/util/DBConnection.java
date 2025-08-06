package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    private static final Logger logger = Logger.getLogger(DBConnection.class.getName());

    private static final String URL = "jdbc:mysql://localhost:3306/billing_system";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // default XAMPP password

    public static Connection getConnection() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // <-- Add this
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        logger.info("✅ Successfully connected to MySQL database.");
        return conn;
    } catch (ClassNotFoundException | SQLException e) {
        logger.log(Level.SEVERE, "❌ DB error: {0}", e.getMessage());
        throw new RuntimeException(e);
    }
}


}
