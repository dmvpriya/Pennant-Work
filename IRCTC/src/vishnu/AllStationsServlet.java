package vishnu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AllStationsServlet
 */
@WebServlet("/AllStationsServlet")
public class AllStationsServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cn = null;
		Statement s = null;
		ResultSet rs = null;

		try {
			Class.forName("org.postgresql.Driver");
			cn = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			String stmt = "SELECT Station_ID, Station_Name FROM public.i213_stations";
			s = cn.createStatement();
			rs = s.executeQuery(stmt);

			StringBuilder options = new StringBuilder();
			while (rs.next()) {
				String stationId = rs.getString("Station_ID");
				String stationName = rs.getString("Station_Name");
				options.append("<option value=\"").append(stationId).append("\">").append(stationName).append("</option>");
			}
			response.setContentType("text/html");
			response.getWriter().write(options.toString());

		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("error");
			// e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (s != null)
					s.close();
				if (cn != null)
					cn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}