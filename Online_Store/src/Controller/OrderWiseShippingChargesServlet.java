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

import DAO.OrderWiseShippingChargesDAL;
import Model.OrderWiseShippingCharges;

@WebServlet("/OrderWiseShippingChargesServlet")
public class OrderWiseShippingChargesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		List<OrderWiseShippingCharges> shippingChargesList = new ArrayList<>();
		OrderWiseShippingChargesDAL shippingChargesDAO = new OrderWiseShippingChargesDAL();

		String productPriceParam = request.getParameter("prodPrice");

		try {

			shippingChargesList = shippingChargesDAO.getShippingCharges(Integer.parseInt(productPriceParam));
			String json = new Gson().toJson(shippingChargesList);
			out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			out.println("Error occurred: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
