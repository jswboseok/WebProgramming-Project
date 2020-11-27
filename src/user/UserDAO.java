package user; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.*;
//import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String; 

public class UserDAO { 
	private String userID; 
	private String userPassword; 
	private String userName; 
	private String userGender; 
	private String userDate; 
	private Connection con; 
	private ResultSet rs; 
	
	
	public UserDAO() 
	{ 
		try {
		String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC"; 
		String dbID = "root"; 
		String dbPassword = "0000"; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection(dbURL, dbID, dbPassword); 
		} 
		catch (Exception e) { e.printStackTrace(); } 
		
	} 
	
	// 로그인 /* * -2: 아이디없음 * -1: 서버오류 * 0: 비밀번호 틀림 * 1: 성공 */ 
	public int login(String userID, String userPassword) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT userPassword FROM user WHERE userID = ?"); 
			pst.setString(1, userID); rs = pst.executeQuery();
			
			if (rs.next()) { 
				return rs.getString(1).equals(userPassword) ? 1 : 0; } 
			else { return -2; } 
			
		} 
		catch (Exception e) {
			e.printStackTrace(); 
			return -1; 
			} 
	} // 중복여부 확인 
	
	public boolean ID_Check(String userID) { 
		try {
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
			pst.setString(1, userID); rs = pst.executeQuery(); 
			if (rs.next()) { 
				return false; 
			} 
			else { 
				return true; 
			} 
		} 
		catch (Exception e) {
			e.printStackTrace(); 
		} 
			return false; 
		} 
	
	// 회원가입 /* * -1: 서버오류 * 0: 이미 존재하는 아이디 * 1: 성공 */ 
	public int join(UserDAO userDAO) { 
		if(!ID_Check(userDAO.getUserID())) 
			return 0; 
		
		try { 
			
			PreparedStatement pst = con.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?)");
			pst.setString(1, userDAO.getUserID());
			pst.setString(2, userDAO.getUserPassword()); 
			pst.setString(3, userDAO.getUserName());
			pst.setString(4, userDAO.getUserGender()); 
			pst.setString(5, userDAO.getUserDate());
			
			return pst.executeUpdate(); 
		} 
		catch (Exception e) {
			e.printStackTrace(); return -1; } 
		} // 유저 데이터 가져오기 
	
	public UserDAO getUser(String userID) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
			pst.setString(1, userID); rs = pst.executeQuery();
			if (rs.next()) { 
				UserDAO userDAO = new UserDAO(); userDAO.setUserID(rs.getString(1));
				userDAO.setUserPassword(rs.getString(2));
				userDAO.setUserName(rs.getString(3)); userDAO.setUserGender(rs.getString(4));
				userDAO.setUserDate(rs.getString(5)); 
				return userDAO; 
			}	 
		} 
		catch (Exception e){ e.printStackTrace(); } 
		
		return null; 
	}
	
	
	public String getUserID() { 
		return userID; } 
	public void setUserID(String userID) {
		this.userID = userID; }
	public String getUserPassword() { 
		return userPassword; } 
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword; } 
	public String getUserName() { 
		return userName; } 
	public void setUserName(String userName) { 
		this.userName = userName; } 
	public String getUserGender() { 
		return userGender; } 
	public void setUserGender(String userGender) {
		this.userGender = userGender; }
	public String getUserDate() { 
		return userDate; } 
	public void setUserDate(String userDate) {
		this.userDate = userDate; } 
	}

