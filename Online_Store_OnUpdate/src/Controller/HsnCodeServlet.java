package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MainDAL;

/**
 * Servlet implementation class HsnCodeServlet
 */
@WebServlet("/HsnCodeServlet")
public class HsnCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gstValue = 0;
		// TODO Auto-generated method stub
		String hsn_code = request.getParameter("hsn_code");
		MainDAL HsnCodeServletDAO = new MainDAL();
		try {
			gstValue = HsnCodeServletDAO.getGstData(hsn_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson json = new Gson();
		String jsonData = json.toJson(gstValue);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		
	}

}
