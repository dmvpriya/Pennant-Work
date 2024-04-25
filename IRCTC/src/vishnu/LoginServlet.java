package vishnu;

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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");

		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Class.forName("org.postgresql.Driver");

			cn = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");

			String stmt = "select \"UserName\",\"Password\" from public.\"dmvp_Login_\" where \"UserName\"=? and \"Password\"=?";

			ps = cn.prepareStatement(stmt);

			ps.setString(1, uname);
			ps.setString(2, pwd);
			rs = ps.executeQuery();

			if (rs.next()) {
				String dbUsername = rs.getString("UserName");
				String dbPassword = rs.getString("Password");

				if (dbUsername.equals(uname) && dbPassword.equals(pwd)) {
					response.sendRedirect("Train.html");
				} else {
					response.sendRedirect("Error.html");
				}
			} else {
				response.sendRedirect("Error.html");
			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("error");
			// e.printStackTrace();
		}

	}

}
