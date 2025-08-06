package controller;

import model.Customer;
import util.DBConnection;
import util.ValidationUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class CustomerServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accNo = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String unitsStr = request.getParameter("units");

        String action = request.getParameter("action");

        if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));

            if (!ValidationUtil.isNotEmpty(name) || !ValidationUtil.isValidPhone(phone) || !ValidationUtil.isValidUnits(unitsStr)) {
                request.setAttribute("error", "Invalid input");
                request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
                return;
            }

            int units = Integer.parseInt(unitsStr);

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "UPDATE customers SET account_number=?, name=?, address=?, phone=?, units_consumed=? WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, accNo);
                stmt.setString(2, name);
                stmt.setString(3, address);
                stmt.setString(4, phone);
                stmt.setInt(5, units);
                stmt.setInt(6, id);
                stmt.executeUpdate();

                response.sendRedirect("viewCustomers.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            return;
        }

        // Default action: Add new customer
        if (!ValidationUtil.isNotEmpty(name) || !ValidationUtil.isValidPhone(phone) || !ValidationUtil.isValidUnits(unitsStr)) {
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("addCustomer.jsp").forward(request, response);
            return;
        }

        int units = Integer.parseInt(unitsStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO customers(account_number, name, address, phone, units_consumed) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, accNo);
            stmt.setString(2, name);
            stmt.setString(3, address);
            stmt.setString(4, phone);
            stmt.setInt(5, units);
            stmt.executeUpdate();

            response.sendRedirect("viewCustomers.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM customers";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("id"));
                c.setAccountNumber(rs.getString("account_number"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setUnitsConsumed(rs.getInt("units_consumed"));
                customerList.add(c);
            }

            request.setAttribute("customers", customerList);
            request.getRequestDispatcher("viewCustomers.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
