package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ServiceableRegionDAl;

/**
 * Servlet implementation class SerivecableRegionServlet
 */
@WebServlet("/SerivecableRegionServlet")
public class SerivecableRegionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pincode = request.getParameter("pincode");
		ServiceableRegionDAl serviceableRegionDAO = new ServiceableRegionDAl();
		boolean isValidPincode = serviceableRegionDAO.checkPinCode(pincode);
		System.out.println(isValidPincode);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(isValidPincode);
		out.flush();

	}
}
