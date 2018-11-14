package bao.TimeLine.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
      if (rs2 != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
      if (pstmt2 != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
      if (con != null) { try { con.close(); } catch (SQLException e) { e.printStackTrace(); } }
   }
   
   
   public void insertWrite(BoardBean bb){
      try {
         con=getCon();
         System.out.println("디비test");
         
         sql="insert into twrite(content,write_file,img_file,date,"
               + "Member_user) values(?,?,?,now(),?)";
         pstmt=con.prepareStatement(sql);
         
         pstmt.setString(1, bb.getContent());
         //System.out.println("디비데이터"+bb.getContent());
         pstmt.setString(2, bb.getWrite_file());
         //System.out.println(bb.getFile());
         pstmt.setString(3, bb.getImg_file());
         //System.out.println(bb.getImg_file());
         pstmt.setString(4, bb.getMember_user());
         pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally { CloseDB(); }
   }
   
   public ArrayList<BoardBean> Writeinfo() {

      ArrayList<BoardBean> Connectlist = null;

      try {
         con=getCon();
         sql = "select * from twrite order by date desc";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
            Connectlist = new ArrayList<BoardBean>();
            BoardBean dto = null;
            while (rs.next()) {
               dto = new BoardBean();
               dto.setContent(rs.getString("content"));
               dto.setWrite_file(rs.getString("write_file"));
               dto.setImg_file(rs.getString("img_file"));
               dto.setDate(rs.getDate("date"));
               dto.setMember_user(rs.getString("Member_user"));
               Connectlist.add(dto);
            }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseDB();
      }
      return Connectlist;
   }
   
// 알림 전송 메서드
	public void alarm(BoardBean bb,int tNum){
		try {
			con = getCon();
			System.out.println("알람 전송 메서드!");
			// 알림
			sql="select member_num from project_member where project_num = ?";
			pstmt=con.prepareStatement(sql);
			// 글 작성할 때 project_num 받아와야함
			pstmt.setInt(1, 1);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sql2="insert into alarm(project_num,member_num,twrite_num,date) values(?,?,?,now())";
				pstmt2=con.prepareStatement(sql2);
				pstmt2.setInt(1, 1);
				pstmt2.setInt(2, rs.getInt("member_num"));
				System.out.println("member_num : "+rs.getInt("member_num"));
				pstmt2.setInt(3, tNum);
				pstmt2.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
	}
	
	// 알림 출력 메서드
	public List alarmList(int memNum) {
		List list = null;
		try {
			con = getCon();
			sql = "select * from alarm where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memNum);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				AlarmBean ab = new AlarmBean();
				ab.setNum(rs.getInt("num"));
				ab.setProject_num(rs.getInt("project_num"));
				ab.setMember_num(rs.getInt("member_num"));
				ab.setTwrite_num(rs.getInt("twrite_num"));
				ab.setDate(rs.getDate("date"));
				list.add(ab);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
		return list;
	}
	
	// twrite에서 project_num 가져오는 메서드 
	public int getProNum(int twrite_num) {
		int proNum=0;
		try {
			con = getCon();
			sql = "select * from twrite where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, twrite_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				proNum = rs.getInt("project_num");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { CloseDB(); }
		return proNum;
	}
}