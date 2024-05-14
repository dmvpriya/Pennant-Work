package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnectivity.DBConnection;
import Model.OrderWiseShippingCharges;

public class OrderWiseShippingChargesDAL {
	private DBConnection db = new DBConnection();
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// Method to retrieve shipping charges based on order value
	public List<OrderWiseShippingCharges> getShippingCharges(int productprice) {
		List<OrderWiseShippingCharges> shippingCharges = new ArrayList<>();

		try {
			con = db.loadProperties();
			String query = "SELECT * FROM dmvp_ordervaluewiseshippingcharges_ WHERE orvl_from >= ? AND orvl_to <= ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, productprice);
			ps.setInt(2, productprice);
			rs = ps.executeQuery();

			if (rs.next()) {
				int orvl_shippingamount = rs.getInt("orvl_shippingamount");

				shippingCharges.add(new OrderWiseShippingCharges(orvl_shippingamount));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return shippingCharges;
	}
}
