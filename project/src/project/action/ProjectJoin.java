package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;
import project.db.ProjectDAO;

public class ProjectJoin implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProjectJoin_execute()");
		
		int proNum = Integer.parseInt(request.getParameter("proNum"));
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		ProjectDAO pdao = new ProjectDAO();
		pdao.ProjectJoin(memNum, proNum);
		
		
		ActionForward forward = new ActionForward();
		// 페이지 이동
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		return forward;
		
	}
}
