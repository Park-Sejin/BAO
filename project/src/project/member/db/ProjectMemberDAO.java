package project.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProjectMemberDAO {
	Connection con = null;
	PreparedStatement prpr = null;
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

		if (prpr != null) {
			try {
				prpr.close();
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
	
	
	
	// 해당 프로젝트 멤버 가져오기
	public List getProjectMember(int num){
		List list = null;
		try {
			con = getCon();
			sql = "select * from project_member where project_num=?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, num);
			rs = prpr.executeQuery();
			list = new ArrayList();
			while(rs.next()){
				ProjectMemberBean pmb = new ProjectMemberBean();
				pmb.setDate(rs.getDate("date"));
				pmb.setMaster(rs.getInt("master"));
				pmb.setMember_num(rs.getInt("member_num"));
				pmb.setNum(rs.getInt("num"));
				pmb.setProject_num(rs.getInt("project_num"));
				
				list.add(pmb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return list;
	}

	
	// 프로젝트 가입할 때 해당 회원이 이미 가입했는지 확인
	public int memberCheck(int memNum, int proNum){
		int check = 0;
		try {
			con = getCon();
			sql = "select * from project_member where project_num = ? and member_num = ?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, proNum);
			prpr.setInt(2, memNum);
			rs = prpr.executeQuery();
			if(rs.next()){
				// 해당 회원이 이미 가입함
				check = 1;
			}else{
				// 가입안한상태
				check=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	
	
	
	
}
