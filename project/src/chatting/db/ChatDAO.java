package chatting.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatDAO {
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
	
	
	// 메세지를 저장하는 메서드
	public void ChatSubmit(ChatBean cb){
		try {
			con=getCon();
			
			sql="insert into chat(receiver,sender,message) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, cb.getReceiver());
			pstmt.setString(2, cb.getSender());
			pstmt.setString(3, cb.getMessage());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
	}
	
	
	// 이메일에 따른 채팅메세지를 가져오는 메서드
	public ArrayList<ChatBean> getChat(String sender_email, String receive_email){
		
		ArrayList<ChatBean> arr = new ArrayList<ChatBean>();
		
		try {
			con=getCon();
			
			sql="select * from chat where (receiver=? and sender=?) or (receiver=? and sender=?) order by date";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, sender_email);
			pstmt.setString(2, receive_email);
			pstmt.setString(3, receive_email);
			pstmt.setString(4, sender_email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChatBean cb = new ChatBean();
				
				cb.setReceiver(rs.getString("receiver"));
				cb.setSender(rs.getString("sender"));
				cb.setMessage(rs.getString("Message"));
				cb.setDate(rs.getDate("date"));
				cb.setRead_cnt(rs.getInt("read_cnt"));
				
				arr.add(cb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
		
		return arr;
	}
	
	
	// 읽음처리 메서드
	public void setRead(String sender_email, String receive_email){
		
		try {
			con=getCon();
			
			sql="select * from chat where sender=? and receiver=? and read_cnt=1 order by date";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, sender_email);
			pstmt.setString(2, receive_email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "update chat set read_cnt=0 where sender=? and receiver=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, receive_email);
				pstmt.setString(2, sender_email);
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
	}
	
	
	
	
}
