package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class UpdateMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("UpdateMemberAction_execute()");
		
		//이메일주소가 없으면 주소이동
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(email == null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
			//response.sendRedirect("./Login.me");
		}
		
		//이메일주소에 해당하는 정보 가져오기
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(email);
		request.setAttribute("mb", mb);
		
		//페이지이동
		forward.setPath("./member/updateMember.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
