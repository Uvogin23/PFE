package Model;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connexion {
	public static  java.sql.Connection con = null;
	public static Statement st = null;
	public static ResultSet r = null;
	
	public String db = "jdbc:mysql://localhost:3306/locationvehicule" ,user = "root",pw = "";
	
	public void createConnexion() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(db,user,pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void closeConnexion() {
		try {
			if(con!=null) 
				con.close();
			if(st!=null)
			     st.close();
			if(r!=null)
				 r.close();
		}catch(SQLException ignore) {
			
		}
		
	}
	
}
	