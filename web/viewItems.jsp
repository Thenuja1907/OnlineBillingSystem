<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Item" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 12px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .action-btns .btn {
            margin-right: 5px;
        }
    </style>
</head>
<body class="py-4">
    <div class="container">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Item List</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Item Name</th>
                                <th>Price ($)</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            if (items != null && !items.isEmpty()) {
                                for (Item i : items) {
                        %>
                            <tr>
                                <td><%= i.getId() %></td>
                                <td><%= i.getItemName() %></td>
                                <td><%= i.getPrice() %></td>
                                <td class="action-btns">
                                    <a href="editItem.jsp?id=<%= i.getId() %>&name=<%= i.getItemName() %>&price=<%= i.getPrice() %>" 
                                       class="btn btn-warning btn-sm">Edit</a>
                                    <form action="ItemServlet" method="post" style="display:inline;" 
                                          onsubmit="return confirm('Are you sure you want to delete this item?');">
                                        <input type="hidden" name="id" value="<%= i.getId() %>">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        <%
                                }
                            } else {
                        %>
                            <tr>
                                <td colspan="4" class="text-center text-muted">No items available.</td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
