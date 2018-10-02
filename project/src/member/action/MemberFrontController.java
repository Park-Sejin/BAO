package member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// 가상 주소 가져와서 필요한 주소만 가져오기
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	System.out.println("command : "+command);
    	
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	
    	// 가상주소를 비교해서 페이지 처리
    	if(command.equals("/member.bo")){ 
    		
    		forward = new ActionForward();
    		forward.setPath("./member/insertForm.jsp");
    		forward.setRedirect(false);
    		
    	}else if(command.equals("/insertAction.bo")){
    		action = new insertAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
    	}
    	
    	
    	
    	
    	// 페이지 이동    
    	if(forward != null){
    		if(forward.isRedirect()){
    			response.sendRedirect(forward.getPath());
    		}else{
    			RequestDispatcher dispatcher =
    					request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);    			
    		}
    	}
    	
    	
    	
    	
    	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	
	

}
