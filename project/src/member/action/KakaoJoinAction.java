package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class KakaoJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("KakaoJoinAction_execute()");
		HttpSession session = request.getSession();
		String id = request.getParameter("userID")+"@ka";
		String name = request.getParameter("userNickName");
		String image = request.getParameter("image");
		MemberBean mb = new MemberBean();
		mb.setEmail(id);
		mb.setName(name);
		mb.setImage(image);
		MemberDAO mdao = new MemberDAO();
		// id가 있는지 체크
		int check = mdao.searchID(id);
		
		if(check == 1){
			//아이디가 있으면 세션생성후 로그인
			//세션정보가져오기
			session.setAttribute("email", id);
		}else if(check == 0){
			// 아이디가 없으면 회원가입 절차 후 세션 생성후 로그인
			mdao.insertKakaoMember(mb);
			session.setAttribute("email", id);
		}
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		
		return forward;
	}
}
