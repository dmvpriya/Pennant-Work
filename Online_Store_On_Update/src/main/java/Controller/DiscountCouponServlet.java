package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MainDAL;
import Model.DiscountCoupon;

/**
 * Servlet implementation class orderProductsServlet
 */
@WebServlet("/DiscountCouponServlet")
public class DiscountCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DiscountCoupon> disCoupvalue = new ArrayList<>();
		String discountValue = request.getParameter("discountPercentage");
		MainDAL OrderProductsDAO = new MainDAL();
		try {
			disCoupvalue = OrderProductsDAO.getDiscountCoupon(Integer.parseInt(discountValue));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson json = new Gson();
		String json_data = json.toJson(disCoupvalue);
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		out.print(json_data);
		
	}

}
