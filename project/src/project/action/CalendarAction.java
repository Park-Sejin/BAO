package project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bao.TimeLine.db.BoardDAO;
import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;
import project.db.ProjectDAO;

public class CalendarAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CalendarAction_execute()");
		
		//파라미터값
		String email = request.getParameter("email");
		String schedule1_S = request.getParameter("schedule1");
		String schedule2_S = request.getParameter("schedule2");
		String work = request.getParameter("work");
		
		//설정이 저장된 이메일이 있는지 확인
		SettingDAO sdao = new SettingDAO();
		int check = sdao.emailCheck(email);
		
		//디비에 변경된 값 SettingBean에 저장
		SettingBean sb = new SettingBean();
		sb.setEmail(email);
		sb.setWork(work);
		if(schedule1_S != null){
			int schedule1 = Integer.parseInt(schedule1_S);
			sb.setSchedule1(schedule1);
		} else if(schedule2_S != null){
			int schedule2 = Integer.parseInt(schedule2_S);
			sb.setSchedule2(schedule2);
		}
		
		if(check == 1){
			//저장된 셋팅값이 있으면 수정 
			sdao.updateSetting(sb);
		} else {
			//저장된 셋팅값이 없으면 저장
			sdao.insertSetting(sb);
		}
		
		//체크된 값 가져가기
		/*BoardDAO bdao = new BoardDAO();
		if(schedule1_S.equals("1")){
			List schedule1List = bdao.getSchedule(email);
			request.setAttribute("schedule1List", schedule1List);
		}
		if(schedule2_S.equals("1")){
			List schedule2List = bdao.getSchedule(email);
			request.setAttribute("schedule2List", schedule2List);
		}
		if(work.equals("내 업무")){
			List workList = bdao.getMyWork(email);
			request.setAttribute("workList", workList);
		} else if(work.equals("요청한 업무")){
			List workList = bdao.getWork(email);
			request.setAttribute("workList", workList);
		} else if(work.equals("전체 업무")){
			List workList = bdao.getAllWork(email);
			request.setAttribute("workList", workList);
		}*/
		
		//업무가져오기
		ProjectDAO pdao = new ProjectDAO();
		List workList = pdao.getWork(email);
		
		return null;
	}

}
