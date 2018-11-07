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

import project.favorite.db.ProjectFavoriteBean;

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

	// 프로젝트 생성
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

			// 프로젝트 추가
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
			if (rs.next()) {
				memNum = rs.getInt("num");
			}

			// 프로젝트 생성시 관리자 추가
			sql = "insert into project_member(project_num,member_num,date,master) values(?,?,now(),1)";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, num);
			prpr.setInt(2, memNum);
			prpr.executeUpdate();

			System.out.println("프로젝트 등록 성공!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}

	// 해당 회원의 프로젝트 리스트 불러오기
	public List getProjectList(int memNum) {
		List list = null;

		try {
			con = getCon();
			sql = "select project.num, project.pro_name, project.id, project.date, project.pro_option"
					+ " from project"
					+ " join project_member"
					+ " on (project.num = project_member.project_num)"
					+ " where project_member.member_num=?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
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

	// 즐겨찾기 추가
	public void projectFavoriteOn(int proNum, int memNum) {
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

	// 즐겨찾기 해지
	public void projectFavoriteOff(int proNum, int memNum) {
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

	// 프로젝트 생성시 즐겨찾기 off
	public void projectFavoriteOff(int memNum) {
		int proNum = 0;
		try {
			con = getCon();
			sql = "select max(num) from project";
			prpr = con.prepareStatement(sql);
			rs = prpr.executeQuery();
			if (rs.next()) {
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

	// 즐겨찾기 리스트 불러오기
	public List getProjectFavoriteList(int memNum) {
		List list = null;
		try {
			con = getCon();
			sql = "select * from project_favorite where member_index = ?";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, memNum);
			rs = prpr.executeQuery();
			list = new ArrayList();

			while (rs.next()) {
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
	}

	// 프로젝트 검색
	public List searchProject(String keyword) {
		List list = null;
		try {
			con = getCon();
			System.out.println("keyword:!!!:"+keyword);
			sql = "select * from project where pro_option=1 and pro_name LIKE ? ";
			prpr = con.prepareStatement(sql);
			prpr.setString(1, "%" + keyword + "%");
			rs = prpr.executeQuery();

			list = new ArrayList();
			while (rs.next()) {
				ProjectBean pb = new ProjectBean();
				pb.setDate(rs.getDate("date"));
				pb.setId(rs.getString("id"));
				pb.setNum(rs.getInt("num"));
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
	
	public void ProjectJoin(int memNum, int proNum){
		try {
			con = getCon();
			sql = "Insert into project_member(project_num,member_num,date,master) values(?,?,now(),0)";
			prpr = con.prepareStatement(sql);
			prpr.setInt(1, proNum);
			prpr.setInt(2, memNum);
			prpr.executeUpdate();
			System.out.println("프로젝트가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	
	// 프로젝트 정보를 가져오는 메서드
	public ProjectBean getProject(int num) {
		
		ProjectBean pb = new ProjectBean();
		
		try {
			con = getCon();
			
			sql = "select * from project";
			prpr = con.prepareStatement(sql);
			
			rs = prpr.executeQuery();
			if(rs.next()) {
				pb.setProName(rs.getString("pro_name"));
				pb.setId(rs.getString("id"));
				pb.setDate(rs.getDate("date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return pb;
	}
	
	
	
	
	

}
