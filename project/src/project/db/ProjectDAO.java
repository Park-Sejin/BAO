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

}
