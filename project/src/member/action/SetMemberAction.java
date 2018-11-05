package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class SetMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("SetMemberAction_execute()");

		//이메일 세션 가져오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		//이메일주소가 없으면 주소이동
		ActionForward forward = new ActionForward();
		if(email == null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//이메일주소에 해당하는 정보 가져오기
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(email);
		
		String name = mb.getName();
		String mobile = mb.getMobile();	
		String team = mb.getTeam();
		String part = mb.getPart();
		String position = mb.getPosition();
		String phone = mb.getPhone();
		String image = mb.getImage();
		
		if(mobile == null){
			mobile = "";
		}
		if(team == null){
			team = "";
		}
		if(part == null){
			part = "";
		}
		if(position == null){
			position = "";
		}
		if(phone == null){
			phone = "";
		}
		
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("mobile", mobile);
		request.setAttribute("team", team);
		request.setAttribute("part", part);
		request.setAttribute("position", position);
		request.setAttribute("phone", phone);
		request.setAttribute("image", image);
		
		//페이지이동
		forward.setPath("./member/baseSet.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
