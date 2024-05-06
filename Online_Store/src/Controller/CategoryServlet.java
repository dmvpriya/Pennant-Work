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

import DAO.CategoryDAO;
import Model.Category;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cart_item_selected = request.getParameter("categories");

		CategoryDAO cart_dao = new CategoryDAO();

		List<Category> cart_catgeories = null;

		cart_catgeories = cart_dao.getAllCategories();
		Gson json = new Gson();
		String json_data = json.toJson(cart_catgeories);
		response.setContentType("application.json");
		PrintWriter out = response.getWriter();
		out.print(json_data);

	}

}