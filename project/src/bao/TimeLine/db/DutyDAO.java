package bao.TimeLine.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DutyDAO {
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
   
   public void insertDuty(DutyBean db){
      try {
         con=getCon();
         System.out.println("DutyBean test1231");
         
         sql="insert into "
               + "duty_write(duty_title,duty_content,duty_file,"
               + "duty_imgfile,duty_admin,duty_firstday,duty_lastday,date) "
               + "values(?,?,?,?,?,?,?,now())"; 
         
         pstmt=con.prepareStatement(sql);
         
         pstmt.setString(1, db.getDuty_title());
         pstmt.setString(2, db.getDuty_content());
         pstmt.setString(3, db.getDuty_file());
         pstmt.setString(4, db.getDuty_imgfile());
         pstmt.setString(5, db.getDuty_admin());
         pstmt.setString(6, db.getDuty_firstday());
         pstmt.setString(7, db.getDuty_lastday());
         pstmt.executeUpdate();
         
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally { CloseDB(); }
   }
   
   public ArrayList<DutyBean> Dutyinfo() {

      ArrayList<DutyBean> Dutylist = null;

      try {
         con=getCon();
         sql = "select * from duty_write order by date desc";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         Dutylist = new ArrayList<DutyBean>();
            DutyBean db = null;
            while (rs.next()) {
               db = new DutyBean();
               db.setDuty_title(rs.getString("duty_title"));
               db.setDuty_content(rs.getString("duty_content"));
               db.setDuty_file(rs.getString("duty_file"));
               db.setDuty_imgfile(rs.getString("duty_imgfile"));
               db.setDuty_admin(rs.getString("duty_admin"));
               db.setDuty_firstday(rs.getString("duty_firstday"));
               db.setDuty_lastday(rs.getString("duty_lastday"));
               db.setDate(rs.getDate("date"));
               Dutylist.add(db);
            }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         CloseDB();
      }
      return Dutylist;
   }
}