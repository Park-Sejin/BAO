package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.db.ProjectDAO;

public class ProjectJoin implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int proNum = Integer.parseInt(request.getParameter("proNum"));
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		System.out.println("ProjectJoin_execute()");
		
		ProjectDAO pdao = new ProjectDAO();
		pdao.ProjectJoin(memNum, proNum);
		
		ActionForward forward = new ActionForward();
		
		// 페이지 이동
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		return forward;
		
	}
}
