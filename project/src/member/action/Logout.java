package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Logout_execute()");
		
		//세션값 가져오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		//로그아웃
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.me");
		forward.setRedirect(true);
		
		return forward;
	}

}
