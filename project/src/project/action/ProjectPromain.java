package project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;
import project.db.ProjectDAO;

public class ProjectPromain implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ProjectPromain_execute()");
		request.setCharacterEncoding("UTF-8");
		
		// 로그인한 사람의 개인 정보를 출력
		// 세션정보를 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("email");
		
		// 세션이 없을 경우 -> 로그인
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 게시판 글 목록 디비에서 가져옴 -> view(jsp)페이지로 전달
		ProjectDAO pdao = new ProjectDAO();
		MemberDAO mdao = new MemberDAO();
		// 전체 글 개수 가져오기
		List projectList = pdao.getProjectList(id);

		// 즐겨찾기 가져오기

		List projectFavoriteList = pdao.getProjectFavoriteList(mdao.getMemberNum(id));

		// request 데이터 저장
		request.setAttribute("projectList", projectList);
		request.setAttribute("projectFavoriteList", projectFavoriteList);

		// 페이지 이동
		forward.setPath("./content/comMainPage.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
