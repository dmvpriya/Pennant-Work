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
 * Servlet implementation class orderProductsServlet
 */
@WebServlet("/DiscountCouponServlet")
public class DiscountCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int disValue = 0;
		String discountValue = request.getParameter("discountCoupon");
		System.out.println(discountValue);
		String totalAmount = request.getParameter("total_Amount");
		System.out.println(totalAmount);
		MainDAL OrderProductsDAO = new MainDAL();
		System.out.println("hi");
		try {
			disValue = OrderProductsDAO.getDiscountCouponValue(discountValue, Integer.parseInt(totalAmount));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson json = new Gson();
		String json_data = json.toJson(disValue);
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		out.print(json_data);

	}

}
