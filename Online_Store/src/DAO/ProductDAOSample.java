package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnectivity.DBConnection;
import Model.Product;

public class ProductDAOSample {
	public List<Product> getAllProducts() throws ClassNotFoundException {
		List<Product> products = new ArrayList<>();
		DBConnection db = new DBConnection();
		try {
			Connection cn = db.loadProperties();
			CallableStatement statement = cn.prepareCall("");
			ResultSet resultSet = statement.executeQuery();
			System.out.println("hi");

			while (resultSet.next()) {
				System.out.println("hi-rs");
				String prodId = resultSet.getString("prod_id");
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
		System.out.println(products);
		return products;
	}
}
