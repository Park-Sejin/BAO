package project.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bao.TimeLine.db.DutyBean;
import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;
import project.db.ProjectDAO;

public class CalendarJSON implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파라미터값
		String email = request.getParameter("email");
		String schedule1_S = request.getParameter("schedule1");
		String schedule2_S = request.getParameter("schedule2");
		String work = request.getParameter("work");
		
		// 설정이 저장된 이메일이 있는지 확인
		SettingDAO sdao = new SettingDAO();
		int check = sdao.emailCheck(email);

		// 디비에 변경된 값 SettingBean에 저장
		SettingBean sb = new SettingBean();
		sb.setEmail(email);
		sb.setWork(work);
		if (schedule1_S != null) {
			int schedule1 = Integer.parseInt(schedule1_S);
			sb.setSchedule1(schedule1);
		} else if (schedule2_S != null) {
			int schedule2 = Integer.parseInt(schedule2_S);
			sb.setSchedule2(schedule2);
		}

		if (check == 1) {
			// 저장된 셋팅값이 있으면 수정
			sdao.updateSetting(sb);
		} else {
			// 저장된 셋팅값이 없으면 저장
			sdao.insertSetting(sb);
		}

		// 업무가져오기
		ProjectDAO pdao = new ProjectDAO();
		if (work.equals("전체 업무")) {
			List workList = pdao.getWork();
			System.out.println("workList: " + workList);
			JSONArray workArr = new JSONArray();
			for(int i=0;i<workList.size();i++){
				JSONObject obj = new JSONObject();
				DutyBean db = (DutyBean)workList.get(i);
				obj.put("title", db.getDuty_title());
				obj.put("date", db.getDate().toString());
				
				workArr.add(obj);
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(workArr);
			out.close();
		}
		

		return null;
	}

}
