package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberLoginAction_execute()");
		
		//email, pass 파라미터 가져오기
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		//객체생성
		MemberDAO mdao = new MemberDAO();
		//email 확인
		int check = mdao.emailCheck(email, pass);
		
		if(check == -1){
			//비밀번호 오류
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 오류');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
			
		} else if(check == 0){
			//아이디없음
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
			
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./content.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
