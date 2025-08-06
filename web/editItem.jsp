<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
    <div class="container">
        <h2 class="mb-4">Edit Item</h2>

        <form action="ItemServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= id %>">

            <div class="mb-3">
                <label class="form-label">Item Name</label>
                <input type="text" name="itemName" class="form-control" value="<%= name %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Price ($)</label>
                <input type="number" step="0.01" name="price" class="form-control" value="<%= price %>" required>
            </div>

            <button type="submit" class="btn btn-success">Update Item</button>
            <a href="ItemServlet" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
