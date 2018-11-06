package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
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
	//emailCheck(name)
	public int emailCheck(String email){
		int check = 0;
		try {
			con=getCon();
			
			sql="select * from member where email=?";
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
	//emailCheck(name)
	
	
	//로그인시 이메일 비밀번호 확인
	//emailCheck(email, pass)
	public int emailCheck(String email, String pass){
		int check = -1;
		try {
			con=getCon();
			
			sql="select pass from member where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				//아이디있다
				if(pass.equals(rs.getString("pass"))){
					//비밀번호 일치
					check = 1;
				} else {
					//비밀번호 불일치
					check = 0;
				}
			} else {
				//아이디없다
				check=-1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return check;
	}
	//emailCheck(email, pass)
	
	
	//회원가입
	//insertMember(mb)
	public void insertMember(MemberBean mb){
		int num=0;
		try {
			con=getCon();
			
			//num 구하기
			sql="select max(num) from member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			} else {
				num = 1;
			}
			
			//멤버 추가
			sql="insert into member(num, name, email, pass, date) values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getPass());
			
			pstmt.executeUpdate();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//insertMember(mb)
	
	
	//비밀번호 변경
	//updatePass(email, pass)
	public void updatePass(String email, String pass){
		try {
			con=getCon();
			
			//email이 있으면 pass를 바꾼다
			sql="select * from member where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				sql="update member set pass=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, pass);
				pstmt.setInt(2, rs.getInt(1));
				
				pstmt.executeUpdate();
				System.out.println("비밀번호 변경이 완료되었습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//updatePass(email, pass)
	
	
	//회원정보수정
	//updateMember(mb)
	public void updateMember(MemberBean mb){
		try {
			con=getCon();
			
			sql="update member set name=?,mobile=?,team=?,part=?,position=?,phone=? where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getMobile());
			pstmt.setString(3, mb.getTeam());
			pstmt.setString(4, mb.getPart());
			pstmt.setString(5, mb.getPosition());
			pstmt.setString(6, mb.getPhone());
			pstmt.setString(7, mb.getEmail());
			
			pstmt.executeUpdate();
			System.out.println("회원정보를 수정이 완료되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//updateMember(mb)
		
	
	//회원정보가져오기
	//getMember(email)
	public MemberBean getMember(String email){
		MemberBean mb = null;
		try {
			con = getCon();
			
			sql="select * from member where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				mb = new MemberBean();
				mb.setEmail(rs.getString("email"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				mb.setDate(rs.getDate("date"));
				mb.setMobile(rs.getString("mobile"));
				mb.setTeam(rs.getString("team"));
				mb.setPart(rs.getString("part"));
				mb.setPosition(rs.getString("position"));
				mb.setPhone(rs.getString("phone"));
				mb.setImage(rs.getString("image"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return mb;
	}
	//getMember(email)
	
	
	//getMemberNum(id)
	public int getMemberNum(String id){
		int num = 0;
		try {
			con = getCon();
			sql = "select * from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt("num");
				}
	         
		} catch (Exception e) {
	    	  e.printStackTrace();
	    } finally {
	    	  	CloseDB();
	    }
		return num;
	}
	//getMemberNum(id)
	
	
	//카카오톡으로 멤버추가
	//insertKakaoMember(mb)
	public void insertKakaoMember(MemberBean mb) {
		int num = 0;
		try {
			con = getCon();

			// num 구하기
			sql = "select max(num) from member";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			// 멤버 추가
			sql = "insert into member(num, name, email, image, date) values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getImage());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	// insertKakaoMember(mb)

	
	//num값구하기
	//searchID(id)
	public int searchID(String id) {
		int check = 0;
		try {
			con = getCon();
			sql = "select num from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return check;
	}
	//searchID(id)


	//getName(num)
	public String getName(int num) {
		String name = "";
		try {
			con = getCon();
			sql = "select name from member where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return name;
	}
	//getName(num)

	
	//프로필 이미지 삽입
	//insertImage(mb)
	public void insertImage(MemberBean mb){
		try {
			con = getCon();
			
			sql = "update member set image=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getImage());
			pstmt.setString(2, mb.getEmail());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
	}
	//insertImage(mb)
	
	
	// 회원번호에 맞는 이름을 가져오는 메서드
	//getMember(num)
	public MemberBean getMember(int num) {
		MemberBean mb = new MemberBean();
		try {
			con = getCon();

			sql = "select * from member where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
	            
				mb.setEmail(rs.getString("email"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
	            mb.setDate(rs.getDate("date"));
	            mb.setMobile(rs.getString("mobile"));
	            mb.setTeam(rs.getString("team"));
	            mb.setPart(rs.getString("part"));
	            mb.setPosition(rs.getString("position"));
	            mb.setPhone(rs.getString("phone"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return mb;
	}
	//getMember(num)
	
	
	
	
	
	
}
