<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Customer" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
<div class="container">
    <h2 class="mb-4">Customer List</h2>

    <table class="table table-bordered table-striped">
        <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Account #</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Units Consumed</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (customers != null && !customers.isEmpty()) {
                for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getAccountNumber() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getUnitsConsumed() %></td>
            <td>
                <a href="editCustomer.jsp?id=<%= c.getId() %>" class="btn btn-sm btn-primary">Edit</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="7" class="text-center">No customers to display.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
