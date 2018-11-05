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
		
		//이메일주소가 없으면 주소이동
		HttpSession session = request.getSession();
		MemberBean mb = new MemberBean();
		String email = (String)session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(email == null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//이메일 주소 넘겨주기
		session.setAttribute("email", email);
		
		forward.setPath("./member/pwdSetting.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
