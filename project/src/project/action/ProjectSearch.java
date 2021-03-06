package project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.db.ProjectDAO;

public class ProjectSearch implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ProjectSearch_execute()");
		
		request.setCharacterEncoding("UTF-8");
		// 로그인한 사람의 개인 정보를 출력
		// 세션정보를 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("email");

		// 세션이 없을 경우 -> 로그인
		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// content.jsp에서 헤더 검색할 때 받아온 변수값
		String type = request.getParameter("search_type1");
		String keyword = request.getParameter("keyword");
		System.out.println("keyword : "+keyword);

		ProjectDAO pdao = new ProjectDAO();
		List searchList = null;
		
		// 카테고리에 따라 검색
		if (type.equals("all")) {
			System.out.println("모든 항목 검색 실행");
			searchList = pdao.searchAll(keyword);
		} else if (type.equals("project")) {
			System.out.println("project 검색 실행");
			searchList = pdao.searchProject(keyword);
		} else if (type.equals("write")) {
			System.out.println("글 검색 실행");
			searchList = pdao.searchWrite(keyword);
		} else if (type.equals("member")) {
			System.out.println("참여자 검색 실행");
			searchList = pdao.searchMember(keyword);
		}
		
		// 검색 결과값 저장
		request.setAttribute("searchList", searchList);
		// 검색타입과 키워드 넘기기
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);

		forward = new ActionForward();
		forward.setPath("content/searchResult.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
