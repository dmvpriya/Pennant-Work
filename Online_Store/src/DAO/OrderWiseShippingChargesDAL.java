package DAO;

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
	public List<OrderWiseShippingCharges> getShippingCharges() {
		double shippingCharges = 0.0;

		List<OrderWiseShippingCharges> charges = new ArrayList<>();

		try {
			con = db.loadProperties();
			String query = "SELECT * FROM dmvp_OrderValueWiseShippingCharges ";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				int orvl_id = rs.getInt("orvl_id");
				double orvl_from = rs.getInt("orvl_from");
				double orvl_to = rs.getInt("orvl_to");
				double orvl_shippingamount = rs.getInt("orvl_shippingamount");

				charges.add(new OrderWiseShippingCharges(orvl_id, orvl_from, orvl_to, orvl_shippingamount));

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

		return charges;
	}
}