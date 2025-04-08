<% 
    session.invalidate(); // End session
    response.sendRedirect("login.jsp"); // Redirecting back to login
%>
