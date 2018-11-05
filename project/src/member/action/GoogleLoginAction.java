package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class GoogleLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("GoogleLoginAction_execute()");
		//한글처리
		request.setCharacterEncoding("UTF-8");

		//email, name 파라미터 가져오기
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		//객체생성
		MemberDAO mdao = new MemberDAO();
		
		//email 확인
		int check = mdao.emailCheck(email);
		
		if(check == 0 ){
			//동일한 이메일 없다 => db에 저장
			MemberBean mb = new MemberBean();
			mb.setName(name);
			mb.setEmail(email);
			mdao.insertMember(mb);
		} 
		
		//동일한 이메일이 존재한다(check==1)
		//세션정보가져오기
		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		
		return forward;
	}

}
