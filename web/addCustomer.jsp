<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
    <div class="container">
        <h2 class="mb-4">Add Customer</h2>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="CustomerServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" class="form-control" name="accountNumber" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea class="form-control" name="address" rows="2" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Units Consumed</label>
                <input type="number" class="form-control" name="units" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Customer</button>
        </form>
    </div>
</body>
</html>
