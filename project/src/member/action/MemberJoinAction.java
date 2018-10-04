package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberJoinAction_execute");
		
		String name = request.getParameter("name");
		
		System.out.println(name);
		
		/*Forward
		
		forward = new ActionForward();
		forward.setPath("./member/join.jsp");
		forward.setRedirect(false);*/
		
		
		
		return null;
	}
	
}
