package DAO;

import java.sql.SQLException;
import java.util.List;

import Model.Category;
import Model.DiscountCoupon;
import Model.OrderProducts;
import Model.OrderWiseShippingCharges;
import Model.Product;
import Model.UnServiceableRegion;

public interface DAO {
	List<Product> getAllProducts() throws SQLException;

	List<Category> getAllCategories() throws SQLException;

	List<Product> getAllProductsOfCategory(int categorySelected, int minPrice, int maxPrice) throws SQLException;

	int getShippingCharges(int a) throws SQLException;

	boolean checkPinCode(String pinCode, String product_id) throws SQLException;
	
	int getGstData(String hsn_code) throws SQLException;
	
	List<DiscountCoupon> getDiscountCoupon(int dcpn_disValue) throws SQLException;
	
	void setOrderProducts(String productId,int quantity,int price,int dcpn_id) throws SQLException;
	
	List<OrderProducts> getOrderProductsData(String productId)throws SQLException;
}
