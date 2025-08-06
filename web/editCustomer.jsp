<%@ page contentType="text/html;charset=UTF-8" language="java" import="model.Customer, java.sql.*, util.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Customer customer = new Customer();

    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT * FROM customers WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            customer.setId(id);
            customer.setAccountNumber(rs.getString("account_number"));
            customer.setName(rs.getString("name"));
            customer.setAddress(rs.getString("address"));
            customer.setPhone(rs.getString("phone"));
            customer.setUnitsConsumed(rs.getInt("units_consumed"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
<div class="container">
    <h2 class="mb-4">Edit Customer</h2>
    <form action="CustomerServlet" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= customer.getId() %>"/>

        <div class="mb-3">
            <label>Account Number:</label>
            <input type="text" name="accountNumber" value="<%= customer.getAccountNumber() %>" class="form-control" required/>
        </div>

        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" value="<%= customer.getName() %>" class="form-control" required/>
        </div>

        <div class="mb-3">
            <label>Address:</label>
            <input type="text" name="address" value="<%= customer.getAddress() %>" class="form-control"/>
        </div>

        <div class="mb-3">
            <label>Phone:</label>
            <input type="text" name="phone" value="<%= customer.getPhone() %>" class="form-control" required/>
        </div>

        <div class="mb-3">
            <label>Units Consumed:</label>
            <input type="number" name="units" value="<%= customer.getUnitsConsumed() %>" class="form-control" required/>
        </div>

        <button type="submit" class="btn btn-success">Update</button>
        <a href="CustomerServlet" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
