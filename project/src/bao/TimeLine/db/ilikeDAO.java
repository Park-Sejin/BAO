package bao.TimeLine.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ilikeDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	PreparedStatement pstmt2 = null;
	String sql2 = "";
	ResultSet rs2 = null;

	// 디비연결 메서드
	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/bao");
		con = ds.getConnection();

		return con;
	}

	// 디비자원해제 메서드
	public void CloseDB() {
		if (rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if (rs2 != null) { try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if (pstmt2 != null) { try { pstmt2.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if (con != null) { try { con.close(); } catch (SQLException e) { e.printStackTrace(); } }
	}
	
	
	// 좋아요 추가 메서드
	public void Push_like(ilikeBean lb){
		
		try {
			con=getCon();
			
			sql = "select * from ilike where like_email=? and b_num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, lb.getLike_email());
			pstmt.setInt(2, lb.getB_num());
			
			rs = pstmt.executeQuery();
			if(!rs.next()){
			
				sql = "insert into ilike(like_email,b_num,push_cnt) values(?,?,1)";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, lb.getLike_email());
				pstmt.setInt(2, lb.getB_num());
				
				pstmt.executeUpdate();
				
				
				
				sql = "select * from ilike where b_num=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, lb.getB_num());
				rs = pstmt.executeQuery();
				
				int cnt = 0;
				while(rs.next()){
					
				}
				
			}else {
				sql = "update ilike set push_cnt = push_cnt+1 where like_email=? and b_num=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, lb.getLike_email());
				pstmt.setInt(2, lb.getB_num());
				
				pstmt.executeUpdate();
				
				/*sql = "update ilike set total"*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
	}
	
	
	
	
	
}
