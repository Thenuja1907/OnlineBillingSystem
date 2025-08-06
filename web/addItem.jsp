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
    <title>Add Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
    <div class="container">
        <h2 class="mb-4">Add Item</h2>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="ItemServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Item Name</label>
                <input type="text" class="form-control" name="itemName" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Price ($)</label>
                <input type="number" step="0.01" class="form-control" name="price" required>
            </div>
            <button type="submit" class="btn btn-success">Add Item</button>
        </form>
    </div>
</body>
</html>
