<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, model.Customer, model.Bill" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    Bill bill = (Bill) request.getAttribute("bill");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
<div class="container">
    <h2 class="mb-4">Calculate Customer Bill</h2>

    <form action="BillingServlet" method="post" class="mb-4">
        <div class="mb-3">
            <label class="form-label">Select Customer</label>
            <select name="customerId" class="form-select" required>
                <option value="">-- Select Customer --</option>
                <% if (customers != null) {
                    for (Customer c : customers) { %>
                        <option value="<%= c.getId() %>"><%= c.getName() %> (ID: <%= c.getId() %>)</option>
                <%  }
                } %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Generate Bill</button>
    </form>

    <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } else if (bill != null) { %>
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white">Bill Details</div>
            <div class="card-body">
                <p><strong>Customer Name:</strong> <%= bill.getCustomer().getName() %></p>
                <p><strong>Units Consumed:</strong> <%= bill.getUnitsConsumed() %> units</p>
                <hr>
                <p><strong>Base Amount:</strong> $<%= String.format("%.2f", bill.getTotalAmount()) %></p>
                <p><strong>Tax (10%):</strong> $<%= String.format("%.2f", bill.getTax()) %></p>
                <h5><strong>Total Payable:</strong> $<%= String.format("%.2f", bill.getGrandTotal()) %></h5>
            </div>
        </div>
    <% } %>
</div>
</body>
</html>
