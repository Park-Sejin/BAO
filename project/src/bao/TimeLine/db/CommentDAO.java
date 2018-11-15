package bao.TimeLine.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import chatting.db.ChatBean;

public class CommentDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;

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
		if (con != null) { try { con.close(); } catch (SQLException e) { e.printStackTrace(); } }
	}
	
	
	// 댓글을 저장하는 메서드
	public void insertComment(CommentBean cb){
		try {
			con=getCon();
			
			sql="insert into comment(cmt_board_num,cmt_email,cmt_content) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, cb.getCmt_board_num());
			pstmt.setString(2, cb.getCmt_email());
			pstmt.setString(3, cb.getCmt_content());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
	}
	
	
	// 댓글을 가져오는 메서드
	public ArrayList<CommentBean> getComment(){
		ArrayList<CommentBean> arr = new ArrayList<CommentBean>();
		
		try {
			con=getCon();
			
			sql="select * from comment";
			pstmt=con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentBean cb = new CommentBean();
				
				cb.setCmt_num(rs.getInt("cmt_num"));
				cb.setCmt_board_num(rs.getInt("cmt_board_num"));
				cb.setCmt_content(rs.getString("cmt_content"));
				cb.setCmt_email(rs.getString("cmt_email"));
				cb.setDate(rs.getDate("date"));
				
				arr.add(cb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
		
		return arr;
	}
	
	
	// 지정 회원의 마지막 댓글 가져오는 메서드
		public CommentBean LastComment(String email){
			CommentBean cb = new CommentBean();
			
			try {
				con=getCon();
				
				sql="select * from comment where cmt_email=? order by cmt_num desc;";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cb.setCmt_num(rs.getInt("cmt_num"));
					cb.setCmt_board_num(rs.getInt("cmt_board_num"));
					cb.setCmt_content(rs.getString("cmt_content"));
					cb.setCmt_email(rs.getString("cmt_email"));
					cb.setDate(rs.getDate("date"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally { CloseDB(); }
			
			return cb;
		}
	
	
	
}
