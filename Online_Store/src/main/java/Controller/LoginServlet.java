package Controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnectivity.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		DBConnection db = new DBConnection();

		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("hi1");
		try {
			cn = db.loadProperties();
			String stmt = "select user_name,user_password from login where user_name=? and user_password=?";
			System.out.println("hi5");
			ps = cn.prepareStatement(stmt);
			System.out.println("hi6");
			ps.setString(1, uname);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			System.out.println("hi7");
			if (rs.next()) {
				System.out.println("hi8");
				String dbUsername = rs.getString("user_name");
				String dbPassword = rs.getString("user_password");

				if (dbUsername.equals(uname) && dbPassword.equals(pwd)) {
					System.out.println("hi9");
					response.sendRedirect("Home.jsp");
				} else {
					response.sendRedirect("Error.html");
				}
			} else {
				response.sendRedirect("Error.html");
			}
		} catch (SQLException e) {
			System.out.println("error");
			// e.printStackTrace();
		}

	}

}