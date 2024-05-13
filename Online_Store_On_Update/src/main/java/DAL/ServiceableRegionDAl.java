package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBConnectivity.DBConnection;

public class ServiceableRegionDAl {
	private DBConnection db = new DBConnection();
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public boolean checkPinCode(String pinCode) {
		boolean pinCodeExists = false;

		try {
			con = db.loadProperties();
			String query = "SELECT COUNT(*) FROM dmvp_ServiceableRegions_ WHERE srrg_pinfrom = ? OR srrg_pinto = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, Integer.parseInt(pinCode));
			ps.setInt(2, Integer.parseInt(pinCode));
			rs = ps.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				pinCodeExists = count > 0;
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

		return pinCodeExists;
	}
}