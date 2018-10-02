package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비 연결 메서드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/bao");
		con = ds.getConnection();
		
		return con;
	}

	// 디비 자원 해제
	public void CloseDB(){
		if(rs != null) { try{ rs.close(); }catch (Exception e) { e.printStackTrace(); } }
		if(pstmt != null) { try{ pstmt.close(); }catch (Exception e) { e.printStackTrace(); } }
		if(con != null) { try{ con.close(); }catch (Exception e) { e.printStackTrace(); } }
	}
	
	public void insertMember(int num, String name){
		try {
			con = getConnection();
			
			sql = "insert into member(num,name) values(?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
