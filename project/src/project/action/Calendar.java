package project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bao.TimeLine.db.BoardDAO;
import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;

public class Calendar implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calendar_execute()");
		
		//이메일 세션 가져오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		// 세션이 없을 경우 -> 로그인
		ActionForward forward = new ActionForward();
		if(email == null){
			forward.setPath("./Login.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//이메일주소에 해당하는 정보 가져오기
		SettingDAO sdao = new SettingDAO();
		SettingBean sb = sdao.getSetting(email);
		//저장된 일정 확인
		/*BoardDAO bdao = new BoardDAO();*/
		//저장된 정보가 있으면 값 넘기기
		if(sb != null){
			String schedule1 = Integer.toString(sb.getSchedule1());
			//내가 등록한 일정을 달력에 표시하도록 되어있으면 값 가져오기
			if(schedule1 != null && schedule1.equals("1")){
				//List schedule1List = bdao.getSchedule(email); //만들기
				//if(schedule1List != null){
				//	request.setAttribute("schedule1List", schedule1List);
				//}
			}
			String schedule2 = Integer.toString(sb.getSchedule2());
			if(schedule2 != null && schedule2.equals("1")){
				//List schedule2List = bdao.getSchedule(email); //만들기
				//if(schedule2List != null){
				//	request.setAttribute("schedul21List", schedul21List);
				//}
			}
			String work = sb.getWork();
			/*if(work != null){
				if(work.equals("내 업무")){
					//List workList = bdao.getMyWork(email); //만들기
					//request.setAttribute("workList", workList);
				} else if(work.equals("요청한 업무")){
					//List workList = bdao.getWork(email); //만들기
					//request.setAttribute("workList", workList);
				} else if(work.equals("전체 업무")){
					//List workList = bdao.getAllWork(email); //만들기
					//request.setAttribute("workList", workList);
				}
			}*/
			
			request.setAttribute("schedule1", schedule1);
			request.setAttribute("schedule2", schedule2);
			request.setAttribute("work", work);
		}
		
		//이메일정보 넘기기
		request.setAttribute("email", email);
		
		//페이지이동
		forward.setPath("./content/calendar.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
