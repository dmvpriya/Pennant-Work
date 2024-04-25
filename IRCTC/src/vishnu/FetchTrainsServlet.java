package vishnu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FetchTrainsServlet
 */
@WebServlet("/FetchTrainsServlet")
public class FetchTrainsServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date = request.getParameter("Date");
		LocalDate ldate = LocalDate.parse(date);

		int day = ldate.getDayOfMonth();

		Connection cn = null;
		Statement s = null;
		ResultSet rs = null;

		try {
			Class.forName("org.postgresql.Driver");
			cn = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			String stmt = "SELECT t.train_no, t.train_name, ts.trst_arrival, ts.trst_departure \n" +
              "FROM i213_trains t\n" +
              "INNER JOIN i213_trainstations ts ON t.train_no = ts.train_no \n" +
              "WHERE t.trst_index < ts.trst_index AND " +
              "      t.train_schedule LIKE CONCAT('%', ?, '%') AND " +
              "      SUBSTRING(t.train_schedule, ? + 1, 1) <> 'x';";

			s = cn.createStatement();
			rs = s.executeQuery(stmt);

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
