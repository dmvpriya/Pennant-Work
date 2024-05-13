package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import DBConnectivity.DBConnection;
import Model.Category;
import Model.DiscountCoupon;
import Model.OrderProducts;
import Model.OrderWiseShippingCharges;
import Model.Product;
import Model.UnServiceableRegion;

public class MainDAL implements DAO {

	@Override
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<>();
		DBConnection db = new DBConnection();
		try {
			Connection cn = db.loadProperties();
			CallableStatement statement = cn.prepareCall("{CALL GetAllProducts()}");
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				String prodId = resultSet.getString("prod_id");
				String prodName = resultSet.getString("prod_name");
				int prodPrice = resultSet.getInt("prod_price");
				String prodHsnCode = resultSet.getString("prod_hsn_code");
				String prodImage = resultSet.getString("prod_image");
				int prodCategoryId = resultSet.getInt("prod_category_id");
				int prodDiscount = resultSet.getInt("prod_discount");

				Product product = new Product(prodId, prodName, prodPrice, prodHsnCode, prodImage, prodCategoryId,prodDiscount);
				products.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> cartCategories = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection con = db.loadProperties();
			CallableStatement statement = con.prepareCall("{CALL GetAllCategories()}");
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				int categoryId = rs.getInt("prod_category_id");
				String categoryName = rs.getString("prod_category_name");
				cartCategories.add(new Category(categoryId, categoryName));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cartCategories;
	}

	@Override
	public List<Product> getAllProductsOfCategory(int categorySelected, int minPrice, int maxPrice) {
		List<Product> categoricalProducts = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection con = db.loadProperties();
			CallableStatement statement = con.prepareCall("{CALL GetProductsByCategoryAndPriceRange(?, ?, ?)}");
			statement.setInt(1, categorySelected);
			statement.setInt(2, minPrice);
			statement.setInt(3, maxPrice);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				String prodId = rs.getString("prod_id");
				String prodName = rs.getString("prod_name");
				int prodPrice = rs.getInt("prod_price");
				String prodHsnCode = rs.getString("prod_hsn_code");
				String prodImage = rs.getString("prod_image");
				int prodCategoryId = rs.getInt("prod_category_id");
				int prodDiscount = rs.getInt("prod_discount");

				Product product = new Product(prodId, prodName, prodPrice, prodHsnCode, prodImage, prodCategoryId,prodDiscount);
				categoricalProducts.add(product);

			}
			System.out.println(categoricalProducts);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return categoricalProducts;
	}

	@Override
	public int getShippingCharges(int productPrice) {
		int shippingCharges = 0;

		try {
			DBConnection db = new DBConnection();
			Connection con = db.loadProperties();
			CallableStatement statement = con.prepareCall("{CALL GetShippingChargesForProductPrice(?)}");
			statement.setInt(1, productPrice);
			statement.execute();
			ResultSet rs = statement.getResultSet();

			while (rs.next()) {
				shippingCharges = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return shippingCharges;
	}

	@Override
	public boolean checkPinCode(String pinCode, String product_id) {
	    boolean pinCodeExists = false;

	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.loadProperties();
	        CallableStatement statement = con.prepareCall("{? = CALL CheckPinCodeExists(?, ?)}");
	        statement.registerOutParameter(1, Types.BOOLEAN);
	        statement.setString(2, product_id);
	        statement.setInt(3, Integer.parseInt(pinCode));
	        statement.execute();
	        pinCodeExists = statement.getBoolean(1);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return pinCodeExists;
	}

	@Override
	public int getGstData(String hsn_code) throws SQLException {
		// TODO Auto-generated method stub
		int gst = 0;
		try {
	        DBConnection db = new DBConnection();
	        Connection con = db.loadProperties();
	        CallableStatement statement = con.prepareCall("{CALL getGst(?)}");
	        statement.setString(1, hsn_code);
	        statement.execute();
	        ResultSet rs = statement.getResultSet();
	        if (rs.next()) {
	            gst = rs.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return gst;

	}

	@Override
	public List<DiscountCoupon> getDiscountCoupon(int dcpndisValue)
			throws SQLException {
		// TODO Auto-generated method stub
		List<DiscountCoupon> disCoup = new ArrayList<>();
		try {
	        DBConnection db = new DBConnection();
	        Connection con = db.loadProperties();
	        CallableStatement statement = con.prepareCall("{call getDisCoupData(?)}");
	        statement.setInt(1, dcpndisValue);
	        statement.execute();
	        ResultSet rs = statement.getResultSet();
	        while(rs.next()) {
	        	int dcpnId = rs.getInt("dcpn_id");
	        	String dcpn_code = rs.getString("dcpn_code");
	        	int dcpn_disValue = rs.getInt("dcpn_disValue");
	        	int dcpn_noc = rs.getInt("dcpn_noc");
	        	
	        	disCoup.add(new DiscountCoupon(dcpn_noc, dcpn_code, dcpn_disValue, dcpn_noc));
	        	
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return disCoup;
	}

	@Override
	public void setOrderProducts(String productId, int quantity, int price, int dcpn_id) throws SQLException {
		// TODO Auto-generated method stub
		
		try {
	        DBConnection db = new DBConnection();
	        Connection con = db.loadProperties();
	        CallableStatement statement = con.prepareCall("{select setOrderProducts(?,?,?,?)}");
	        statement.setString(1, productId);
	        statement.setInt(2, quantity);
	        statement.setInt(3, price);
	        statement.setInt(4, dcpn_id);
	        statement.execute();
	        

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
	}

	@Override
	public List<OrderProducts> getOrderProductsData(String productId) throws SQLException {
		// TODO Auto-generated method stub
		
		List<OrderProducts> orderproddata = new ArrayList<>();
		try {
	        DBConnection db = new DBConnection();
	        Connection con = db.loadProperties();
	        CallableStatement statement = con.prepareCall("{call getOrderProducts(?)}");
	        statement.setString(1, productId);
	        statement.execute();
	        ResultSet rs = statement.getResultSet();
	        while(rs.next()) {
	        	String orderId = rs.getString("order_id");
	        	String product_Id = rs.getString("product_id");
	        	int orderQuantity = rs.getInt("order_quantity");
	        	int orderPrice = rs.getInt("order_price");
	        	int dcpn_id = rs.getInt("dcpn_id");
	        	
	        	orderproddata.add(new OrderProducts(orderId, product_Id, orderQuantity, orderPrice, dcpn_id));
	        	
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return orderproddata;
	}
}
