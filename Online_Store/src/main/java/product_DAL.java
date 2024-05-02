import java.sql.*;
public class product_DAL {
	public static void main(String[]args) {
		
		Connection cn = null;
		Statement s = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("org.postgresql.Driver");
            cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=17@Vishnu");
            
		}catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
	}
}
