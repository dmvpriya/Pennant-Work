package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MainDAL;
import Model.Product;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hi-PS");
		MainDAL productDAO = new MainDAL();
		List<Product> products = null;
		products = productDAO.getAllProducts();
		Gson gson = new Gson();
		String json = gson.toJson(products);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json);

	}
}