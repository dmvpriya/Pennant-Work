package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MainDAL;
import Model.OrderWiseShippingCharges;

@WebServlet("/OrderWiseShippingChargesServlet")
public class OrderWiseShippingChargesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		int shippingCharges = 0;
		MainDAL shippingChargesDAO = new MainDAL();

		String productPriceParam = request.getParameter("productPrice");
		try {
			shippingCharges = shippingChargesDAO.getShippingCharges(Integer.parseInt(productPriceParam));
			String json = new Gson().toJson(shippingCharges);
			out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			out.println("Error occurred: " + e.getMessage());
		}
	}

	
}
