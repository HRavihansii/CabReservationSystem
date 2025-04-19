package servlet;

import model.User;
import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<User> users = new ArrayList<>();

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            String sql = "SELECT * FROM Users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUid(rs.getInt("uid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setTelephone(rs.getString("telephone"));
                user.setAddress(rs.getString("address"));

                users.add(user);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageUsers.jsp");
        dispatcher.forward(request, response);
    }
}

