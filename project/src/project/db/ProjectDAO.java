package project.db;

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

public class ProjectDAO {
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

	public void insertProject(ProjectBean pb) {
		int num = 0;
		try {
			con = getCon();

			// num 구하기
			sql = "select max(num) from project";
			prpr = con.prepareStatement(sql);
			rs = prpr.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			sql = "insert into project(num,pro_name, id, date, pro_option) values(?,?,?,now(),?)";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, num);
			prpr.setString(2, pb.getProName());
			prpr.setString(3, pb.getId());
			prpr.setInt(4, pb.getOption());
			prpr.executeUpdate();
			
			sql = "select * from member where email=?";
			prpr = con.prepareStatement(sql);
			prpr.setString(1, pb.getId());
			rs = prpr.executeQuery();
			int memNum = 0;
			String memName = "";
			if(rs.next()){
				memNum = rs.getInt("num");
				memName = rs.getString("name");
			}
			
			
			sql = "insert into project_member(project_num,member_num,member_name,date) values(?,?,?,now())";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, num);
			prpr.setInt(2, memNum);
			prpr.setString(3, memName);
			prpr.executeUpdate();
			
			System.out.println("프로젝트 등록 성공!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}

	public List getProjectList(String id) {
		List list = null;

		try {
			con = getCon();
			sql = "select * from project where id=?";
			prpr = con.prepareStatement(sql);
			prpr.setString(1, id);
			rs = prpr.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				ProjectBean pb = new ProjectBean();
				pb.setNum(rs.getInt("num"));
				pb.setDate(rs.getDate("date"));
				pb.setId(rs.getString("id"));
				pb.setOption(rs.getInt("pro_option"));
				pb.setProName(rs.getString("pro_name"));

				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}
	
	public void projectFavoriteOn(int proNum, int memNum){
		try {
			con = getCon();
			sql = "update project_favorite set favorite=1 where member_index=? and project_index=?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			prpr.setInt(2, proNum);
			prpr.executeUpdate();
			System.out.println("즐겨찾기 성공!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	public void projectFavoriteOff(int proNum,int memNum){
		try {
			con = getCon();
			sql = "update project_favorite set favorite=0 where member_index=? and project_index=?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			prpr.setInt(2, proNum);
			prpr.executeUpdate();
			System.out.println("즐겨찾기 성공!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	public void projectFavoriteOff(int memNum){
		int proNum = 0;
		try {
			con = getCon();
			sql = "select max(num) from project";
			prpr = con.prepareStatement(sql);
			rs = prpr.executeQuery();
			if(rs.next()){
				proNum = rs.getInt("max(num)");
			}
			
			sql = "insert into project_favorite(member_index,project_index,favorite) values(?,?,0)";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			prpr.setInt(2, proNum);
			prpr.executeUpdate();
			System.out.println("즐겨찾기 성공!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	/*public List getProjectFavoriteList(int memNum){
		List list = null;
		try {
			con = getCon();
			sql = "select * from project_favorite where member_index = ?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			rs = prpr.executeQuery();
			list = new ArrayList();
			
			while(rs.next()){
				ProjectFavoriteBean pfb = new ProjectFavoriteBean();
				pfb.setNum(rs.getInt("num"));
				pfb.setMemNum(memNum);
				pfb.setProNum(rs.getInt("project_index"));
				pfb.setFavorite(rs.getInt("favorite"));
				
				list.add(pfb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return list;
		
	}*/

}
