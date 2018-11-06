package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class PwdSet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PwdSet_execute()");
		
		//이메일 세션값 받아오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		
		//이메일 주소 넘겨주기
		session.setAttribute("email", email);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/pwdSetting.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
