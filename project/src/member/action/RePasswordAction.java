package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberDAO;

public class RePasswordAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RePasswordAction_execute()");
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		System.out.println("email : "+ email);
		
		MemberDAO mdao = new MemberDAO();
		mdao.updatePass(email, pass);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.me");
		forward.setRedirect(true);
		
		return forward;
	}

}
