package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnectivity.DBConnection;
import Model.Product;

public class ProductCategoryListDAO {
    DBConnection db = new DBConnection();
    Connection con; 
    PreparedStatement ps;
    ResultSet rs;
    
    
    public List<Product> getAllProductsOfCatgeory(int category_selected,int minPrice,int maxPrice) {
    	
    	List<Product> categorical_products = new ArrayList<>();
    	System.out.println("DAO"+category_selected);
    	try {
            con = db.loadProperties(); 
            String category_stmt = "select * from products where prod_category_id = ? and prod_price between ? and ?";
            ps = con.prepareStatement(category_stmt);
            ps.setInt(1,category_selected);
            ps.setInt(2, minPrice);
            ps.setInt(3, maxPrice);
            rs = ps.executeQuery();
            while(rs.next()) {
            	String prodId = rs.getString("prod_id");
				String prodName = rs.getString("prod_name");
				int prodPrice = rs.getInt("prod_price");
				int prodGst = rs.getInt("prod_gst");
				String prodImage = rs.getString("prod_image");
				int prodCategoryId = rs.getInt("prod_category_id");

				Product product = new Product(prodId, prodName, prodPrice, prodGst, prodImage, prodCategoryId);

				categorical_products.add(product);
            	
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return categorical_products;
    }
}
