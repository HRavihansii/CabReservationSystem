<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"2".equals(role)) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Driver Dashboard</title></head>
<body>
    <h1>Welcome, Driver <%= username %>!</h1>
    <p>This is your exclusive dashboard.</p>
</body>
</html>
