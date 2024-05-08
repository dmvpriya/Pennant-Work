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

import DAO.ProductCategoryListDAL;
import Model.Product;

/**
 * Servlet implementation class ProductCategoryListServlet
 */
@WebServlet("/ProductCategoryListServlet")
public class ProductCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category_selected = request.getParameter("Categories");
		String price_selected = request.getParameter("priceRange");
		String[] priceRange = price_selected.split("-");
		int minPrice = Integer.parseInt(priceRange[0]);
		int maxPrice = Integer.parseInt(priceRange[1]);
		System.out.println("Servlet" + category_selected);

		ProductCategoryListDAL productsList = new ProductCategoryListDAL();

		List<Product> prodOfCategory = new ArrayList<>();

		prodOfCategory = productsList.getAllProductsOfCatgeory(Integer.parseInt(category_selected), minPrice, maxPrice);
		Gson json = new Gson();
		String json_data = json.toJson(prodOfCategory);
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		out.print(json_data);

	}

}