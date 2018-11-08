package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberDAO;

public class RePasswordAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RePasswordAction_execute()");
		
		//파라미터값 가져오기
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		//비밀번호 수정
		MemberDAO mdao = new MemberDAO();
		mdao.updatePass(email, pass);
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.me");
		forward.setRedirect(true);
		
		return forward;
	}

}
