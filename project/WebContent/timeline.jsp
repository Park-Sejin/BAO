<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>

      <link href="css/timeline.css" rel="stylesheet" type="text/css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <script src="jquery-sortable.js"></script>

<script type="text/javascript">
// $(function  () {
//      $("ul").sortable();
//    });

         $(document).ready(function(){
            $("#timelineDiv2").hide();
            $("#timelineDiv3").hide();
            $("#timelineDiv4").hide();
            
            //클릭시 div 숨김표시
            $("#button1").click(function() {
               $("#timelineDiv1").show();
               $("#timelineDiv2").hide();
               $("#timelineDiv3").hide();
               $("#timelineDiv4").hide();
            });
                  
            
            $("#button2").click(function() {
                  $("#timelineDiv2").show();
                  $("#timelineDiv1").hide();
                  $("#timelineDiv3").hide();
                  $("#timelineDiv4").hide();
            });
            $("#button3").click(function() {
                  $("#timelineDiv3").show();
                  $("#timelineDiv1").hide();
                  $("#timelineDiv2").hide();
                  $("#timelineDiv4").hide();
            });
            $("#button4").click(function() {
                  $("#timelineDiv4").show();
                  $("#timelineDiv1").hide();
                  $("#timelineDiv2").hide();
                  $("#timelineDiv3").hide();
            });
            //클릭시 div 숨김표시
            $("#check1").click(function() {
               if($("#check1").is(":checked") == true){
                  $("#fristsc").hide();
                  $("#center_spen").hide();
                  $("#lastsc").hide();
               }else{
                  $("#fristsc").show();
                  $("#center_spen").show();
                  $("#lastsc").show();
               };
               
            });
            
            $("#plus").click(function() {
               var plus ="<li><div><input type='text' size='80' placeholder='할일 입력하세요.'  style='width:94%;font-size: 16px; border: 0; color:gray;'></div></li>";
               $(this).parent().parent().prev().find('ul').append(plus);
               
            });
            
            
            
             $("ul").sortable();


            
            
         });
         
   
            
            
      
         
      
      </script>
   </head>
   
   <body>
      
      <jsp:include page="right_menu.jsp"></jsp:include>
      <jsp:include page="LeftHeader.jsp"></jsp:include>
      <jsp:include page="top3.jsp"></jsp:include>
      
      
      
      <article id="timeline">
         <div id="title">
            <span id="time_left">
               <img src="img/timeline/gray_star.png"> 'bao' 업무 공유방(n)
               <img src="img/timeline/compy.png">
            </span>
            <span id="time_right">
               <img src=""style="border: 1px solid; width: 10px; height: 10px;">
               <img src=""style="border: 1px solid; width: 10px; height: 10px;">
            </span>
         </div>
         <div id="mar_btm"></div>
         
         
         <div id="report">
            <div id="chart_title">
               <img src="img/timeline/check.png">
               업무 리포트 보기(전체 n개)
               <a id="chart_up"><span style="visibility: hidden;">닫기</span></a><br>
            </div>
            
            <div id="chart">
               <div id="chart_cir">
                  그림
               </div>
               
               <ul id="chart_list">
                  <li><span class="chart1"></span> 요청      <strong> n건 </strong>   <span class="chart1">n%</span></li>
                  <li><span class="chart2"></span> 진행      <strong> n건 </strong>   <span class="chart2">n%</span></li>
                  <li><span class="chart3"></span> 피드백   <strong> n건 </strong>   <span class="chart3">n%</span></li>
                  <li><span class="chart4"></span> 완료      <strong> n건 </strong>   <span class="chart4">n%</span></li>
                  <li><span class="chart5"></span> 보류      <strong> n건 </strong>   <span class="chart5">n%</span></li>
               </ul>
            </div>
         </div>
         <div id="mar_btm"></div>
         
         
         <div id="time_write">
            <table style="border:1px solid #EAEAEA; border-collapse: collapse; width:700px;">
               <tr align="center">
                  <td  style=" width:25%; height:45px; border:1px solid #EAEAEA; cursor:pointer; ">
                        <input type="button" id="button1">
                  </td>
                  <td  style=" width:25%; height:45px; border:1px solid #EAEAEA; cursor:pointer;">
                        <input type="button" id="button2">
                  </td>
                  <td style="width:25%; height:45px; border:1px solid #EAEAEA;cursor:pointer;">
                        <input type="button" id="button3" >
                  </td>
                  <td  style="width:25%; height:45px; border:1px solid #EAEAEA;cursor:pointer;">
                        <input type="button" id="button4">
                  </td>
               </tr>
            </table>
            
         </div>
         
         <!-- 글 -->
         <div id="timelineDiv1">
            <table style="border:1px solid #EAEAEA; border-collapse: collapse;">
               <tr>
                  <td colspan="2">
                     <textarea rows="10" cols="95" placeholder="글을 작성하세요" style="width:97%;line-height:18px;font-size: 16px; border: 0;font-weight: bold; color:gray;margin-left:10px;margin-top:10px;"></textarea>
                  </td>
               </tr>
               <tr style="height:50px;">
                  <td style="vertical-align:middle;" >
                     &nbsp;
                     <a>
                        <img src="img/timeline/icon_attach_file.png" style="vertical-align: middle;">
                           <span style="font-size:15px; font-weight:bold;">파일첨부 </span>
                     </a>
                     &nbsp;&nbsp;&nbsp;
                     <a>
                     <img src="img/timeline/icon_attach_pic.png" style="vertical-align: middle;">
                        <span style="font-size:15px; font-weight:bold;">이미지첨부</span>
                     </a>
                     
                  </td>
                  <td align="right">
                     <input type="submit" value="올리기" style="background-color:#5f5ab9; border:#5f5ab9;color:#fff;font-weight:bold; width:100px; height:30px;">
                     &nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>
         <!-- 글 -->
         <!-- 업무 -->
         <div id="timelineDiv2">
            <table style="border:1px solid #EAEAEA; border-collapse: collapse; " >
               <tr>
                  <td colspan="2" height="50px" style="vertical-align:middle;">
                     <input type="text" size="95" placeholder="업무명을 입력하세요"  style="width:97%;line-height: 18px;font-size: 16px; border: 0;font-weight: bold; color:gray;margin-left:10px;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px margin-left:10px;">
                     <img src="img/timeline/ico_timec4ca.png">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px; " height="30px">
                     <img src="img/timeline/ico_userli_num_gr.png" style="vertical-align: middle;">
                     <select style="margin-left:5px;">
                        <option></option>
                        <option></option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/ico_cal_task01c4ca.png" style="vertical-align: middle;"> 
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/ico_cal_task02c4ca.png" style="vertical-align: middle;"> 
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/ico_flag.png" style="vertical-align: middle;"> 
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/icon_flag2.png" style="vertical-align: middle;"> 
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="padding:2px 10px;">
                     <textarea rows="10" cols="97" placeholder="글을 작성하세요" style="width:97%;line-height:18px;font-size: 16px; border: 0;font-weight: bold; color:gray;margin-left:10px;margin-top:10px;"></textarea>
                  </td>
               </tr>
               <tr style="height:50px;">
                  <td style="vertical-align:middle; " >
                     &nbsp;
                     <a>
                        <img src="img/timeline/icon_attach_file.png" style="vertical-align: middle;">
                           <span style="font-size:15px; font-weight:bold;">파일첨부 </span>
                     </a>
                     &nbsp;&nbsp;&nbsp;
                     <a>
                     <img src="img/timeline/icon_attach_pic.png" style="vertical-align: middle; margin-left:10px;">
                        <span style="font-size:15px; font-weight:bold;">이미지첨부</span>
                     </a>
                     
                  </td>
                  <td align="right" >
                     <input type="submit" value="올리기" style="background-color:#5f5ab9; border:#5f5ab9;color:#fff;font-weight:bold; width:100px; height:30px;">
                     &nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>
         
         
         <!-- 업무 -->
         <!-- 일정 -->
         <div id="timelineDiv3">
            <table style="border:1px solid #EAEAEA; border-collapse: collapse; " >
               <tr>
                  <td colspan="2" height="50px" style="vertical-align:middle;">
                     <input type="text" size="95" placeholder="일정 제목을 입력하세요"  style="width:97%;line-height: 18px;font-size: 16px; border: 0;font-weight: bold; color:gray;margin-left:10px;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px margin-left:10px;">
                     <img src="img/timeline/ico_timec4ca.png">
                     <select id="fristsc">
                        <option value="00:00">00:00</option>
                        <option value="01:00">01:00</option>
                        <option value="02:00">02:00</option>
                        <option value="03:00">03:00</option>
                        <option value="04:00">04:00</option>
                        <option value="05:00">05:00</option>
                        <option value="06:00">06:00</option>
                        <option value="07:00">07:00</option>
                        <option value="08:00">08:00</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
                        <option value="24:00">24:00</option>
                     </select>
                     <spen id="center_spen">~</spen>
                     <select id="lastsc">
                        <option value="00:00">00:00</option>
                        <option value="01:00">01:00</option>
                        <option value="02:00">02:00</option>
                        <option value="03:00">03:00</option>
                        <option value="04:00">04:00</option>
                        <option value="05:00">05:00</option>
                        <option value="06:00">06:00</option>
                        <option value="07:00">07:00</option>
                        <option value="08:00">08:00</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
                        <option value="24:00">24:00</option>
                     </select>
                     <input type="checkbox" id="check1"> 종일
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px; " height="30px">
                     <img src="img/timeline/ico_mapc4ca.png" style="vertical-align: middle;">
                     
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/ico_memoc4ca.png" style="vertical-align: middle;margin-right:10px; "><input type="text" size="80" placeholder="메모을 입력하세요"  style="width:94%;font-size: 16px; border: 0; color:gray;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border:1px solid #EAEAEA; border-collapse: collapse; padding:2px 10px;" height="30px">
                     <img src="img/timeline/ico_alarmc4ca.png" style="vertical-align: middle;"> 
                  </td>
               </tr>
               
               
               
               <tr style="height:50px;">
                  <td>
                  </td>
                  <td align="right" >
                     <input type="submit" value="올리기" style="background-color:#5f5ab9; border:#5f5ab9;color:#fff;font-weight:bold; width:100px; height:30px;">
                     &nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>
         
         
         <!-- 일정 -->
         <!-- 할일 -->
         <div id="timelineDiv4">
            <table style="border:1px solid #EAEAEA; border-collapse: collapse;">
               <tr>
                  <td colspan="2" height="50px" style="vertical-align:middle;">
                     <input type="text" size="95" placeholder="할일 제목을 입력하세요."  style="width:97%;line-height: 18px;font-size: 16px; border: 0;font-weight: bold; color:gray;margin-left:10px;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="padding:2px 10px;">
                     <ul id="sortable">
                        <li>
                           <div>
                              <input type="text" size="80" placeholder="할일 입력하세요."  style="width:50%;font-size: 16px; border: 0; color:gray;">
                           </div>
                        </li>
                        
                     </ul>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="padding:2px 30px;">
                     <a id="plus"><img src="img/timeline/pf_ico4_on.png"> 할일추가</a>
                  </td>
               </tr>
               <tr style="height:50px;">
                  <td>                  
                  </td>
                  <td align="right">
                     <input type="submit" value="올리기" style="background-color:#5f5ab9; border:#5f5ab9;color:#fff;font-weight:bold; width:100px; height:30px;">
                     &nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>
         <!-- 할일 -->
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      </article>
   </body>
</html>