package project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.db.ProjectDAO;

public class ProjectListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProjectListAction_execute()");
		
		// id 세션값으로 받아올것!!
		String id = "admin";
		
		// 게시판 글 목록 디비에서 가져옴 -> view(jsp)페이지로 전달
		ProjectDAO pdao = new ProjectDAO();

		// 전체 글 개수 가져오기
		List projectList = pdao.getProjectList(id);

		// request 데이터 저장
		request.setAttribute("projectList", projectList);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./content/content.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
