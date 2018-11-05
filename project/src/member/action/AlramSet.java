package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AlramSet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("AlramSet_execute()");
		
		//이메일 세션 가져오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		//이메일주소에 해당하는 정보 가져오기
		
		//넘겨줄 정보 저장
		request.setAttribute("email", email);
		
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./member/alramSetting.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
