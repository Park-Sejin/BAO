package bao.TimeLine.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimeLineController extends HttpServlet{
   
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
       // 가상 주소 가져와서 필요한 주소만 가져오기
       String requestURI = request.getRequestURI();
       String contextPath = request.getContextPath();
       String command = requestURI.substring(contextPath.length());
       System.out.println("command : "+command);
       
       
       ActionForward forward = null;
       Action action = null;
       
       
       // 액션갔다가 돌아와 리턴받은 값을 forward로 저장해 밑의  if문 페이지 이동
       // 글 작성부분
       if(command.equals("/TimeLineWriteAction.tl")){
          //System.out.println("controller");
          action = new TimeLineWriteAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }
       }else if(command.equals("/Timeline.tl")) {
          forward = new ActionForward();
          forward.setPath("./TimeLine/timeline.jsp");
          forward.setRedirect(false);
       }else if(command.equals("/TimeLineDutyWriteAction.tl")){
          action = new TimeLineDutyWriteAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }
          
       }else if(command.equals("/FileDownloadAction.tl")){
          action = new FileDownloadAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }
       }else if(command.equals("/myBoard.tl")) {
          forward = new ActionForward();
          forward.setPath("./content/my_board.jsp");
          forward.setRedirect(false);
       }else if(command.equals("/CommentAction.tl")) {
    	   action = new CommentAction();
           try{
              forward=action.execute(request, response);
           }catch(Exception e){
              e.printStackTrace();
           }
       }
       

       
       // 페이지 이동    
       if(forward != null){
         if(forward.isRedirect()){
            response.sendRedirect(forward.getPath());
         } else {
            RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
            dis.forward(request, response);
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