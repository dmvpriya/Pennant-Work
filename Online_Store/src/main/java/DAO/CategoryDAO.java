package DAO;

import Model.Category;
import DBConnectivity.DBConnection;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CategoryDAO {
	public List<Category> getAllCategories() {
		List<Category> cart_category = new ArrayList<>();
		
		
		try {
			DBConnection db = new DBConnection();
			Connection con = db.loadProperties();
			String cart_Stmt = "select * from products_category";
			PreparedStatement ps = con.prepareStatement(cart_Stmt);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int prod_category_id = rs.getInt("prod_category_id");
				String prod_category_name = rs.getString("prod_category_name");
				cart_category.add(new Category(prod_category_id, prod_category_name));
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return cart_category;
	}

}
