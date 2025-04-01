<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"1".equals(role)) {
        response.sendRedirect("adminDashboard.jsp");
    }
%>
<html>
<head><title>Admin Dashboard</title></head>
<body>
    <h1>Welcome, Admin <%= username %>!</h1>
    <p>This is your exclusive dashboard.</p>
</body>
</html>
