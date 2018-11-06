package member.setting.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SettingDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;

	// 디비연결 메서드 생성
	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/bao");
		con = ds.getConnection();

		return con;
	}

	// 디비자원해제
	public void CloseDB() {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//동일한 이메일이 존재하는지 확인
	//emailCheck(email)
	public int emailCheck(String email){
		int check = 0;
		try {
			con=getCon();
			
			sql="select * from setting where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 1;
			}
			
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return check;
	}
	//emailCheck(email)
	
	
	//설정삽입
	//insertSetting(sb)
	public void insertSetting(SettingBean sb){
		int num=0;
		try {
			con=getCon();
			
			//num 구하기
			sql="select max(num) from setting";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			} else {
				num = 1;
			}
			
			sql="insert into setting(num, email, alram, color) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, sb.getEmail());
			pstmt.setString(3, sb.getAlram());
			pstmt.setString(4, sb.getColor());
			
			pstmt.executeUpdate();
			System.out.println("설정등록");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//insertSetting(sb)
	
	
	//설정수정
	//updateSetting(sb)
	public void updateSetting(SettingBean sb){
		try {
			con=getCon();
			
			if(sb.getAlram() != null){
				//알람수정
				sql="update setting set alram=? where email=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, sb.getAlram());
				pstmt.setString(2, sb.getEmail());
				
				pstmt.executeUpdate();
				System.out.println("알람 설정 수정");
				
			} else if(sb.getColor() != null){
				//색상 수정
				sql="update setting set color=? where email=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, sb.getColor());
				pstmt.setString(2, sb.getEmail());
				
				pstmt.executeUpdate();
				System.out.println("색상 설정 수정");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//updateSetting(sb)
	
	
	//이메일에 해당하는 설정 가져오기
	//getSetting(email)
	public SettingBean getSetting(String email){
		SettingBean sb = null;
		try {
			con=getCon();
			
			sql="select * from setting where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				sb = new SettingBean();
				sb.setEmail(rs.getString("email"));
				sb.setAlram(rs.getString("alram"));
				sb.setColor(rs.getString("color"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return sb;
	}
	//getSetting(email)
	
	
	
	
	
}
