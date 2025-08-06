package controller;

import model.Bill;
import model.Customer;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillingServlet extends HttpServlet {

    // ✅ Reusable method to load customer list from the database
    private List<Customer> loadCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM customers";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                customers.add(c);
            }
        }
        return customers;
    }

    // ✅ GET request: loads customers and shows form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Customer> customers = loadCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    // ✅ POST request: generates bill and reloads form with bill data
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerIdStr = request.getParameter("customerId");

        try {
            List<Customer> customers = loadCustomers(); // Load for redisplay
            request.setAttribute("customers", customers);

            if (customerIdStr == null || customerIdStr.isEmpty()) {
                request.setAttribute("error", "Please select a customer.");
                request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
                return;
            }

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT * FROM customers WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(customerIdStr));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    Customer c = new Customer();
                    c.setId(rs.getInt("id"));
                    c.setName(rs.getString("name"));
                    c.setUnitsConsumed(rs.getInt("units_consumed"));

                    Bill bill = new Bill(c);

                    // Save bill to database
                    String insertSql = "INSERT INTO bills (customer_id, units_consumed, rate_per_unit, total_amount, bill_date) VALUES (?, ?, ?, ?, NOW())";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setInt(1, c.getId());
                    insertStmt.setInt(2, bill.getUnitsConsumed());
                    insertStmt.setDouble(3, bill.getRatePerUnit());
                    insertStmt.setDouble(4, bill.getGrandTotal());
                    insertStmt.executeUpdate();

                    request.setAttribute("bill", bill);
                } else {
                    request.setAttribute("error", "Customer not found.");
                }
            }

            request.getRequestDispatcher("calculateBill.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            try {
                request.setAttribute("customers", loadCustomers());
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
        }
    }
}
