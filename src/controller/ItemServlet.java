package controller;

import model.Item;
import util.DBConnection;
import util.ValidationUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class ItemServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String itemName = request.getParameter("itemName");
        String priceStr = request.getParameter("price");

        // Handle Update Item
        if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));

            if (!ValidationUtil.isNotEmpty(itemName) || !ValidationUtil.isValidPrice(priceStr)) {
                request.setAttribute("error", "Invalid item input");
                request.getRequestDispatcher("editItem.jsp").forward(request, response);
                return;
            }

            double price = Double.parseDouble(priceStr);

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "UPDATE items SET item_name=?, price=? WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, itemName);
                stmt.setDouble(2, price);
                stmt.setInt(3, id);
                stmt.executeUpdate();
                response.sendRedirect("viewItems.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            return;
        }

        // Handle Delete Item
        if ("delete".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "DELETE FROM items WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                stmt.executeUpdate();
                response.sendRedirect("viewItems.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            return;
        }

        // Default: Add new item
        if (!ValidationUtil.isNotEmpty(itemName) || !ValidationUtil.isValidPrice(priceStr)) {
            request.setAttribute("error", "Invalid item input");
            request.getRequestDispatcher("addItem.jsp").forward(request, response);
            return;
        }

        double price = Double.parseDouble(priceStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO items(item_name, price) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setDouble(2, price);
            stmt.executeUpdate();
            response.sendRedirect("viewItems.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Item> itemList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM items";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Item i = new Item();
                i.setId(rs.getInt("id"));
                i.setItemName(rs.getString("item_name"));
                i.setPrice(rs.getDouble("price"));
                itemList.add(i);
            }

            request.setAttribute("items", itemList);
            request.getRequestDispatcher("viewItems.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
