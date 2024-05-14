package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MainDAL;

/**
 * Servlet implementation class UnSerivecableRegionServlet
 */
@WebServlet("/UnSeriveceableRegionServlet")
public class UnSeriveceableRegionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pincode = request.getParameter("pincode");
		String[] productIds = request.getParameterValues("itemIds[]");

		MainDAL unserviceableRegionDAO = new MainDAL();
		Map<String, Boolean> UnServicable = new HashMap<>();

		System.out.println(pincode + " " + productIds);

		if (productIds != null) {
			for (String productId : productIds) {
				System.out.println("Product ID in cart: " + productId);
				boolean isUnServiceable = unserviceableRegionDAO.checkPinCode(pincode, productId);
				UnServicable.put(productId, isUnServiceable);
			}

		} else {
			System.out.println("No product IDs in cart");
		}

		Gson json = new Gson();
		String jsonData = json.toJson(UnServicable);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		out.flush();
	}
}
