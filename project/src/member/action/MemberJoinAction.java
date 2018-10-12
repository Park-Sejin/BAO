package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberBean;
import member.db.MemberDAO;


public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberJoinAction_execute()");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//전달받은 데이터 저장
		MemberBean mb = new MemberBean();
		mb.setName(request.getParameter("name"));
		mb.setEmail(request.getParameter("email"));
		mb.setPass(request.getParameter("pass"));
		
		//객체생성
		MemberDAO mdao = new MemberDAO();
		mdao.insetMember(mb);
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.me");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
