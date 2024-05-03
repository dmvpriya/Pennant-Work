import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("hi-PS");
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = null;
        try {
            products = productDAO.getAllProducts();
            Gson gson = new Gson();
            String json = gson.toJson(products);
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(json);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
