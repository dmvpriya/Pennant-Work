package Demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	public List<Product> getAllProducts() throws ClassNotFoundException {
		List<Product> products = new ArrayList<>();

		try {
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");
			PreparedStatement statement = conn.prepareStatement("SELECT * FROM dmvp_products_");
			ResultSet resultSet = statement.executeQuery();
			System.out.println("hi");

			while (resultSet.next()) {

				int prodId = resultSet.getInt("prod_id");
				String prodName = resultSet.getString("prod_name");
				int prodPrice = resultSet.getInt("prod_price");
				int prodGst = resultSet.getInt("prod_gst");
				String prodImage = resultSet.getString("prod_image");
				int prodCategoryId = resultSet.getInt("prod_category_id");

				Product product = new Product(prodId, prodName, prodPrice, prodGst, prodImage, prodCategoryId);

				products.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}
}
