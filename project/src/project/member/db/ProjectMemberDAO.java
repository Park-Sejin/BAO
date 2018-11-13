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

import member.db.MemberBean;

public class ProjectMemberDAO {
	Connection con = null;
	PreparedStatement prpr = null;
	PreparedStatement prpr2 = null;
	PreparedStatement prpr3 = null;
	String sql = "";
	String sql2 = "";
	String sql3 = "";
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;

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
		
		if (rs2 != null) {
			try {
				rs2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (prpr2 != null) {
			try {
				prpr2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (rs3 != null) {
			try {
				rs3.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (prpr3 != null) {
			try {
				prpr3.close();
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
	
	public List getJoinMemberList(int memNum) {
		List list = null;
		try {
			con = getCon();
			sql = "select * from project_member where member_num = ?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			System.out.println("memNum : "+memNum);
			rs = prpr.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				sql2 = "select * from project_member where project_num = ?";
				prpr2 = con.prepareStatement(sql2);
				prpr2.setInt(1, rs.getInt("project_num"));
				System.out.println("project_num : "+rs.getInt("project_num"));
				rs2 = prpr2.executeQuery();
				
				while(rs2.next()) {
						if(memNum != rs2.getInt("member_num")) {
							sql3 = "select * from member where num = ?";
							prpr3 = con.prepareStatement(sql3);
							prpr3.setInt(1, rs2.getInt("member_num"));
							rs3 = prpr3.executeQuery();
							
							if(rs3.next()) {
								MemberBean mb = new MemberBean();
								mb.setDate(rs3.getDate("date"));
								mb.setEmail(rs3.getString("email"));
								mb.setImage(rs3.getString("image"));
								mb.setName(rs3.getString("name"));
								mb.setNum(rs3.getInt("num"));
								System.out.println(rs3.getString("name"));
								list.add(mb);
							}
						}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return list;
	}	
	
	
	
}
