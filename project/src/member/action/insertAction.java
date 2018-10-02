package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberBean;
import member.db.MemberDAO;

public class insertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("insertAction_execute");
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		
		MemberBean mb = new MemberBean();
		
		mb.setNum(num);
		mb.setName(name);
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.insertMember(num, name);
		
		
		return null;
	}
	
	
}
