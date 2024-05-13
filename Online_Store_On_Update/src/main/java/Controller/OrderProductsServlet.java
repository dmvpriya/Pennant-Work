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
import Model.OrderProducts;

/**
 * Servlet implementation class OrderProductsServlet
 */
@WebServlet("/OrderProductsServlet")
public class OrderProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<OrderProducts> orderProdData= new ArrayList<>();
		String product_id = request.getParameter("productId");
		MainDAL OrderProductsDAO = new MainDAL();
		try {
			orderProdData = OrderProductsDAO.getOrderProductsData(product_id);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson json = new Gson();
		String json_data = json.toJson(orderProdData);
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		out.print(json_data);
		
	}

}
