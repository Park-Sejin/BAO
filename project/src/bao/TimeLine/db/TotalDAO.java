package bao.TimeLine.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TotalDAO {
	
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
	
	public ArrayList<TotalBean> Totalinfo(){
		System.out.println("DB12호출");
		ArrayList<TotalBean> Totallist=null;
		
		try{
			con=getCon();

			//sql="select content,write_file,img_file,date,Member_user,null AS duty_title,null AS duty_admin,null AS duty_firstday,null AS duty_lastday from twrite union select duty_content,duty_file,duty_imgfile,date,null,duty_title,duty_admin,duty_firstday,duty_lastday from duty_write order by date desc";
/*			sql="select content,write_file,img_file,date,Member_user,null AS duty_title,null AS duty_admin,null AS duty_firstday,null AS duty_lastday,Table_type"
				+"from twrite"
				+"union"
				+"select duty_content,duty_file,duty_imgfile,date,null,duty_title,duty_admin,duty_firstday,duty_lastday,dutyType"
				+"from duty_write" 
				+"order by date desc";*/
			sql="select content,write_file,img_file,date,Member_user,null AS duty_title,null AS duty_admin,null AS duty_firstday,null AS duty_lastday,Table_type from twrite union select duty_content,duty_file,duty_imgfile,date,null,duty_title,duty_admin,duty_firstday,duty_lastday,dutyType from duty_write order by date desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			Totallist=new ArrayList<TotalBean>();
			TotalBean tb=null;
			while(rs.next()){
				tb=new TotalBean();
				//글
				//if(rs.getString("Table_type").equals("Write")){
					//System.out.print("dd");
					tb.setContent(rs.getString("content"));
					tb.setWrite_file(rs.getString("write_file"));
					tb.setImg_file(rs.getString("img_file"));
					tb.setTdate(rs.getDate("date"));
					tb.setMember_user(rs.getString("Member_user"));
					tb.setTable(rs.getString("Table_type"));
				//}
				//업무
				//if(rs.getString("Table_type").equals("Duty")){
					tb.setDuty_title(rs.getString("duty_title"));
					tb.setDuty_content(rs.getString("content"));
					tb.setDuty_file(rs.getString("write_file"));
					tb.setDuty_imgfile(rs.getString("img_file"));
					tb.setDdate(rs.getDate("date"));
					tb.setDuty_admin(rs.getString("duty_admin"));
					tb.setDuty_firstday(rs.getString("duty_firstday"));
					tb.setDuty_lastday(rs.getString("duty_lastday"));
					tb.setDTable(rs.getString("Table_type"));
				//}
				
				
				Totallist.add(tb);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return Totallist;
	}

}
