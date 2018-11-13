package bao.TimeLine.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bao.TimeLine.db.BoardBean;
import bao.TimeLine.db.DutyBean;
import bao.TimeLine.db.DutyDAO;

public class TimeLineDutyWriteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      request.setCharacterEncoding("UTF-8");
      try{
         int maxPostSize=100*1024*1024;
         ServletContext ctx = request.getServletContext();
         String saveDirectory = ctx.getRealPath("/upload");
         
         
         MultipartRequest mr=new MultipartRequest(
               request,
               saveDirectory,
               maxPostSize,
               "UTF-8",
               new DefaultFileRenamePolicy()
               );
         
         
         // 파일이 여러개, 파일 사이즈 체크
         String fileInput="";
         String fileName=""; //파일이름
         File fileObj=null;
         long fileSize=0;
         Enumeration formNames=mr.getFileNames();
         while(formNames.hasMoreElements()){
            fileInput=(String)formNames.nextElement();  //첫번째 type=file
            fileName=mr.getFilesystemName(fileInput);
            if(fileName!=null){
               
               fileObj=mr.getFile(fileInput);
               fileSize=(long)fileObj.length();
            }
         }
      DutyBean db=new DutyBean();
   
      db.setDuty_title(mr.getParameter("Duty_title"));
      db.setDuty_content(mr.getParameter("Duty_content"));
      db.setDuty_file(mr.getFilesystemName("Duty_file"));
      db.setDuty_imgfile(mr.getFilesystemName("Duty_imgfile"));
      //db.setDuty_admin(mr.getParameter(""));
      //db.setDuty_firstday(mr.getParameter(""));
      //db.setDuty_lastday(mr.getParameter(""));
      
      
      /*System.out.println("1"+db.getDuty_title());
      System.out.println("2"+db.getDuty_content());
      System.out.println("3"+db.getDuty_file());*/
      
      DutyDAO ddao=new DutyDAO();
      ddao.insertDuty(db);
      
      JSONObject obj=null;
      //JSONArray arr=new JSONArray();
      String Write=null;
      obj=new JSONObject();
      obj.put("DTitle",db.getDuty_title());
      obj.put("DCon",db.getDuty_content());
      //obj.put("IF", multi.getParameter("Img_write_file"));
      Write=obj.toString();
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
       out.println(Write);
       out.close();      

      //System.out.println("xasxasxasd"+request.getAttribute("AA"));
      
/*      ActionForward forward = new ActionForward();
      forward.setPath("./TimeLine/divdiv.jsp");
      forward.setRedirect(false);*/
      }catch(Exception e){
      e.printStackTrace();
      }
      return null;
   }
   
   
}