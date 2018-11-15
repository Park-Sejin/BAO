<%@page import="member.db.MemberDAO"%>
<%@page import="bao.TimeLine.db.TotalDAO"%>
<%@page import="bao.TimeLine.db.TotalBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bao.TimeLine.db.BoardDAO"%>
<%@page import="bao.TimeLine.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>

      <link href="./css/timeline.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="./css/top.css">
      <link href="./css/right_menu.css" rel="stylesheet">
      <link href="./css/profile_popup.css" rel="stylesheet">
      <link href="./css/invitebox.css" rel="stylesheet">
      <link href="./css/AllView_popup.css" rel="stylesheet">
      <link href="./css/HeaderCss.css" rel="stylesheet">
      <link href="./css/content.css" rel="stylesheet" type="text/css">
      
      <!-- 구글 Map api -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAtGe_n-epCEfG-V7QP6KP56hMykUp4YE4&v=3.exp&sensor=false&libraries=places"></script>
      <!-- Jquery-->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <!-- datapicker api-->
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
      
      <style type="text/css">
      /* Modal */
#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    /* background: rgba(0,0,0,.3); */
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    /* left: calc( 50% - 160px ); top: calc( 50% - 70px ); */
    width: 223px; height: 200px; 
    background: white;
    z-index: 11;
    padding: 10px;
    margin-top:100px;
    /* margin-left:-700px;
    margin-top:-178px; */
    box-shadow: 10px 10px 20px 20px gray;
}
/* Modal */
/* 담당자 추가 */
#nav{
  border:1px solid #ccc;
  border-width:1px 0;
  list-style:none;
  margin:0;
  padding:0;
}
#nav li{
  display:inline;
}
#nav a{
  display:inline-block;
  padding:10px;
}
      
      </style>

      <script type="text/javascript">

         $(document).ready(function(){
            $("#TDup").hide();
               $("#TCal").hide();
               $("#TWork").hide();
               
               //클릭시 div 숨김표시
               //글쓰기
               $("#write").click(function() {
                  $("#TWirte").show();
                  $("#TDup").hide();
                  $("#TCal").hide();
                  $("#TWork").hide();
            });
                     
                //업무
              $("#Dup").click(function() {
                    $("#TDup").show();
                    $("#TWirte").hide();
                    $("#TCal").hide();
                    $("#TWork").hide();
              });
              //일정
               $("#Cal").click(function() {
                     $("#TCal").show();
                     $("#TWirte").hide();
                     $("#TDup").hide();
                     $("#TWork").hide();
               });
                //할일
               $("#Do").click(function() {
                     $("#TWork").show();
                     $("#TWirte").hide();
                     $("#TDup").hide();
                     $("#TCal").hide();
               });
            /* -------------------------------------------------------------------------- */
               //클릭시 div 숨김표시
               $("#Status").click(function() {
                  if($("#Status").is(":checked") == true){
                     $("#Sel1").hide();
                     $("#center_spen").hide();
                     $("#Sel2").hide();
                  }else{
                     $("#Sel1").show();
                     $("#center_spen").show();
                     $("#Sel2").show();
                  };
               });  
            });
         /* -------------------------------------------------------------------------- */
                    
            /* textbox 담당자 추가 */
             var dupid;
             $("#nav a").click(function(){
              var is=true;
               var id=$(this).text();
                   $('#Chu').find('div').each(function(){
                      dupid = $(this).text();
                      if(dupid==id){
                      is=false;
                      alert("중복입니다.");
                      }
                   });
                 if(is==true){
                    $("#Chu").append("<div style='float:left; display: inline-block;'>"
                             +id+"<input type=button class=btnRemove value=X onclick='remove(this)'>"+
                             "</div>"); 
                   }
            });
             
             /* 항목추가 입력 */
             $("#AddList").click(function(){
                $("#AddList").remove();
                var addTag="";
                addTag+="<div class=line1 'style=border: 3px solid black;'><input type=text id=Startpicker placeholder=시작일 추가 onchange='Change1()'></div><br>";
                addTag+="<div class=line2 id=lastDay 'style=display: block;'><input type=text id=Endpicker placeholder=마감일 추가 onchange='Change2()'></div><br>";
                $("#AddAdd").append(addTag);
                $('#Startpicker').each(function(){
                     $(this).datepicker({
                              dateFormat: 'yy-mm-dd' 
                             ,showOtherMonths: true 
                             ,showMonthAfterYear:true              
                             ,buttonImageOnly: true        
                             ,yearSuffix: "년"
                             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
                             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                             ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
                             ,minDate: "-1M"
                             ,maxDate: "+1M" 
                    });
                 });
                $('#Endpicker').each(function(){
                  $(this).datepicker({
                     dateFormat:'yy-mm-dd'
                  });
              });
             });
         
         
         
         
      </script>
      
      <!-- Text 감지 -->
      <script type="text/javascript">
      var Startia=true;
      var Startiabu; //버튼 중복 제어
      function Change1(){
         
         if(Startia==true){
            var Cancel="";
             Cancel+="<input type=button id=btnRemove value=X onclick='dateremove1(this)'>";
             $(".line1").append(Cancel);
             Startiabu=true;
          }
          $(".line1").find("input[type=button]").each(function(){
            if(Startia==true && Startiabu==true){
               Startia=false;
            }
          });
          
      }
      var Endia=true;
      var Endiabu;
       function Change2(){
          if(Endia==true){
               var Cancel="";
                Cancel+="<input type=button id=btnRemove value=X onclick='dateremove2(this)'>";
                $(".line2").append(Cancel);
                Endiabu=true;
             }
             $(".line2").find("input[type=button]").each(function(){
               if(Endia==true && Endiabu==true){
                  Endia=false;
               }
             });
       }
       
       function dateremove1(obj){
         $(obj).hide();
         Startia=true;
          document.getElementById("Startpicker").value ="";
       }
       
       function dateremove2(obj){
          $(obj).hide();
          Endia=true;
           document.getElementById("Endpicker").value ="";
       }
       
      </script>
      
      <!-- 담당자 삭제 -->
      <script type="text/javascript">
         function remove(obj){
            document.getElementById('Chu').removeChild(obj.parentNode);
         }
      </script>
      
      
      
      
      <!-- 일정부분 달력  -->
      <script type="text/javascript">
         $(document).ready(function(){
            $("#TStart1").datepicker({
                dateFormat:'yy-mm-dd' 
            }).datepicker("setDate", new Date());
            
            $("#TStart2").datepicker({
                dateFormat:'yy-mm-dd' 
            }).datepicker("setDate", new Date());
         });
         
         /* 종일 체크버튼 */
         function Stus(){
            var is=$("#Status").is(":checked");
            if(is==true){
               $("#Sel1").hide();
               $("#Sel2").hide();
            }else{
               $("#Sel1").show();
               $("#Sel2").show();
            }
         }
         /* 종일 체크버튼 */   
      </script>
      
      <!-- 장소검색  -->
      <script type="text/javascript">
      
         function init() {
                var input = document.getElementById('locationTextField');
             var autocomplete = new google.maps.places.Autocomplete(input);
         }
         google.maps.event.addDomListener(window, 'load', init);
      </script>
      
      <!-- chart -->      
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	/*그래프의 종류*/      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
    	  /*그래프 데이터 부분*/
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Pizza');
        data.addColumn('number', 'Populartiy');
        data.addRows([
          ['요청', 8],
          ['진행', 3],
          ['피드백', 11],
          ['완료', 1], 
          ['보류', 0]
        ]);
		
        /*그래프 옵션*/
        var options = {
          title: '업무 리포트'
        };
		
        /*그래프를 그릴 곳의 id*/
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
      
   </head>

<body>
	
	<% String email = (String)session.getAttribute("email");
		int num = Integer.parseInt(request.getParameter("num")); %>
	
	
   <div id="container">
      <jsp:include page="../default/top3.jsp"></jsp:include>
      <jsp:include page="../default/LeftHeader.jsp"></jsp:include>

      <article id="timeline">
         <div id="title">
            <span id="time_left">
               <img src="./img/timeline/gray_star.png"> 'bao' 업무 공유방(n)
               <img src="./img/timeline/compy.png">
            </span>
            <span id="time_right">
               <img src=""style="border: 1px solid; width: 10px; height: 10px;">
               <img src=""style="border: 1px solid; width: 10px; height: 10px;">
            </span>
         </div>
         <div id="mar_btm"></div>
         
         <div id="report">
			<div id="chart">
            		<div id="piechart"></div>
            </div>
         </div>
         
         <div id="mar_btm"></div>


         <div id="time_write">
            <table
               style="border: 1px solid #EAEAEA; border-collapse: collapse; width: 700px;">
               <tr align="center">
                  <td style="width: 25%; height: 45px; border: 1px solid #EAEAEA; cursor: pointer;">
                     <input type="button" id="write">
                  </td>
                  <td style="width: 25%; height: 45px; border: 1px solid #EAEAEA; cursor: pointer;">
                     <input type="button" id="Dup">
                  </td>
                  <td style="width: 25%; height: 45px; border: 1px solid #EAEAEA; cursor: pointer;">
                     <input type="button" id="Cal">
                  </td>
                  <td style="width: 25%; height: 45px; border: 1px solid #EAEAEA; cursor: pointer;">
                     <input type="button" id="Do">
                  </td>
               </tr>
            </table>
         </div>

         <!-- 글 -->
         <form action="" method="post" enctype="multipart/form-data" id="FWriteForm">
            <div id="TWirte">
               <table style="border: 1px solid #EAEAEA; border-collapse: collapse;">
                  <tr>
                     <td colspan="2">
                        <textarea placeholder="글을 작성하세요" rows="10" cols="95" name="content" 
                           style="width: 97%; line-height: 18px; font-size: 16px; border: 0; font-weight: bold; margin-left: 10px; margin-top: 10px;">
                        </textarea>
                     </td>
                  </tr>
                  <tr style="height: 50px;">
                     <td style="vertical-align: middle;">&nbsp;
                        <div class="filebox bs3-primary">
                           <img src="img/timeline/icon_attach_file.png" style="vertical-align: middle;">
                           <label for="ex_file2">파일첨부</label>
                           <input type="file" id="ex_file2" name="write_file">
                        </div>
                        <div class="filebox bs3-success">
                           <img src="img/timeline/icon_attach_pic.png" style="vertical-align: middle;">
                           <label for="ex_file2">이미지첨부</label> 
                           <input type="file" id="ex_file2" name="img_file"> 
                           <input type="hidden" name="num" value="<%=num%>">
                        </div>
                     </td>
                     <td align="right">
                        <input type="button" value="올리기" id="uploadbutton"
                        style="background-color: #5f5ab9; border: #5f5ab9; color: #fff; font-weight: bold; width: 100px; height: 30px;">&nbsp;&nbsp;
                     </td>
                  </tr>
               </table>
            </div>
         </form>
         <script type="text/javascript">
            /* 글 */
            $(document).ready(function(){
               $("#uploadbutton").click(function(){
                  var WformData=new FormData($("#FWriteForm")[0]);
                    $.ajax({
                      url:"./TimeLineWriteAction.tl",
                       processData: false,
                       contentType: false,
                       data: WformData,
                       type: 'POST',
                       success: function(data){
                          $("textarea[name=content]").val("");
                          var json = $.parseJSON(data);
                          var Chutext=json.Con;
                          var Write="<div id='time_board'>";
                          	Write+="<div id='time_body'>";
                          	Write+="<div id='time_profile'>";
                          	Write+="<img alt='프로필사진' src='./img/right_menu/img_photo_null32.png' id='profile_img'>";
                          	Write+="<span id='time_info' style='width: 100px;'>";
                          	Write+=json.Name
                          	<%-- Write+="<b><%= mdao.getMember(bb.getMember_user()).getName() %></b><br>"; --%>
                          	Write+="<span style='color: #c0c0c0;font-size: 12px;'>" + json.Date + "</span>";
                          	<%-- Write+="<span style='color: #c0c0c0;font-size: 12px;'><%=bb.getDate() %></span>"; --%>
                          	Write+="</span>";
                          	Write+="</div>";
                          	Write+="<div class='clear'></div>";
                          	Write+="<div id='time_content'>";
                          	<%-- Write+="<%=bb.getContent() %>"; --%>
                          	Write+=json.Content;
                          	Write+="</div>";
                          	Write+="<div>";
                          	Write+="<a href=''>좋아요</a>";
                          	Write+="<a href=''>댓글달기</a>";
                          	Write+="</div>";
                          	Write+="</div>";
                          	Write+="<div id='mar_btm'></div>";
                          	Write+="</div>";
                          	Write+="</div>";
                          	
                            /* Write+="<div style='' id=TWirte>";
                            Write+="'" + json.WF + "'";
                            Write+="'" + Chutext.replace(/\r\n/gi,"<br>") + "'";
                            Write+="<br>";
                            Write+="</div>"; */
                            $("#time_board").prepend(Write);
                       }
                  });
               });
            });
            /* 글 작성 끝 */
         </script>
         <!-- 글 -->
         
         <script type="text/javascript">

         /* Modal */
          $("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
            $("#my-dialog,#dialog-background").toggle();
         });
         /* Modal */
         
         
      $("#AddList").click(function(){
      $("#AddList").remove();
      var addTag="";
      addTag+="<div class=line1 'style=border: 3px solid black;'><input type=text id=Startpicker placeholder=시작일 추가 onchange='Change1()'></div><br>";
      addTag+="<div class=line2 id=lastDay 'style=display: block;'><input type=text id=Endpicker placeholder=마감일 추가 onchange='Change2()'></div><br>";
      $("#AddAdd").append(addTag);
      $('#Startpicker').each(function(){
           $(this).datepicker({
                    dateFormat: 'yy-mm-dd' 
                   ,showOtherMonths: true 
                   ,showMonthAfterYear:true              
                   ,buttonImageOnly: true        
                   ,yearSuffix: "년"
                   ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
                   ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                   ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                   ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
                   ,minDate: "-1M"
                   ,maxDate: "+1M" 
          });
       });
      $('#Endpicker').each(function(){
        $(this).datepicker({
           dateFormat:'yy-mm-dd'
        });
    });
   });
         </script>
         <!-- 업무 -->
         <form action="" method="post" enctype="multipart/form-data" id="DutyWriteForm">
            <div id="TDup">
               <table style="border: 1px solid #EAEAEA; border-collapse: collapse;">
                  <tr>
                     <td colspan="2" height="50px" style="vertical-align: middle;">
                        <input type="text" size="95" placeholder="업무명을 입력하세요"  id="Val1" name="Duty_title" 
                        style="width: 97%; line-height: 18px; font-size: 16px; border: 0; font-weight: bold; color: gray; margin-left: 10px;">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;"
                        height="30px margin-left:10px;">
                        <img src="img/timeline/ico_timec4ca.png">
                        <button>요청</button><button>진행</button><button>피드백</button><button>완료</button><button>보류</button>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                        <img src="img/timeline/ico_userli_num_gr.png" style="vertical-align: middle;">
                        <!-- 담당자 추가 되는부분 -->
                        <div id="Wrap">
           				<div id="btn-open-dialog" style="width:100px; margin-left: 30px; text-align: center; margin-top: -14px; border: 1px solid #EAEAEA;">담당자 추가</div>
            			<!-- 담당자 추가 되는부분 -->
            			</div>
                     </td>
                  </tr>
                  
                  	<input type="button" value="항목추가 입력" id="AddList">
                  
                  
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                        <img src="img/timeline/ico_cal_task01c4ca.png" style="vertical-align: middle;">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                        <img src="img/timeline/ico_cal_task02c4ca.png" style="vertical-align: middle;">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                        <img src="img/timeline/ico_flag.png" style="vertical-align: middle;">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                        <img src="img/timeline/icon_flag2.png" style="vertical-align: middle;">
                     </td>
                  </tr>
                  
                  
                  
                  <tr style="height: 50px;">
                     <td style="vertical-align: middle;">&nbsp;
                        <a> <img src="img/timeline/icon_attach_file.png" style="vertical-align: middle;">
                           <span style="font-size: 15px; font-weight: bold;">파일첨부 </span>
                        </a> &nbsp;&nbsp;&nbsp;
                        <a> <img src="img/timeline/icon_attach_pic.png" style="vertical-align: middle; margin-left: 10px;">
                           <span style="font-size: 15px; font-weight: bold;">이미지첨부</span>
                        </a>
   
                     </td>
                     <td align="right">
                        <input type="submit" value="올리기"
                           style="background-color: #5f5ab9; border: #5f5ab9; color: #fff; font-weight: bold; width: 100px; height: 30px;">&nbsp;&nbsp;
                     </td>
                  </tr>
               </table>
            </div>
        <div id="my-dialog" style="border: 3px solid red;">
      <!-- 이미지 사진 추가  -->
         <ul id="nav">
            <li><a href="#">류수재</a></li>
            <li><a href="#">박세진</a></li>
            <li><a href="#">박수진</a></li>
            <li><a href="#">엄재철</a></li>
            <li><a href="#">여준혁</a></li>
            <li><a href="#">이미진</a></li>
         </ul>
       <!-- 이미지 사진 추가  -->
     </div>
   		<!-- 외부영역 클릭시 -->
	   <div id="dialog-background"></div>
	   <!-- 외부영역 클릭시 -->
            
         </form>
         <!-- 업무 -->
         
         <!-- 일정 -->
         <div id="TCal">
            <table style="border: 1px solid #EAEAEA; border-collapse: collapse;">
               <tr>
                  <td colspan="2" height="50px" style="vertical-align: middle;">
                     <input type="text" size="95" placeholder="일정 제목을 입력하세요" id="Schedule_title"
                     style="width: 97%; line-height: 18px; font-size: 16px; border: 0; font-weight: bold; color: gray; margin-left: 10px;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px margin-left:10px;">
                     <img src="img/timeline/ico_timec4ca.png">
                     <input type="text" id="TStart1">
                     <select id="Sel1">
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
                     </select> <span id="center_spen">~</span>
                     
                     <input type="text" id="TStart2">
                     <select id="Sel2">
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
                     </select> <input type="checkbox" id="Status" onclick="Stus()">종일
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                     <img src="img/timeline/ico_mapc4ca.png" style="vertical-align: middle;">
                     <input id="locationTextField" type="text" placeholder="장소를 입력하세요" style="border:none; font-weight: bold; height: 30px;" size="40">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                     <img src="img/timeline/ico_memoc4ca.png" style="vertical-align: middle; margin-right: 10px;">
                     <input id="Memo_sinput" type="text" size="80" placeholder="메모을 입력하세요" style="width: 94%; font-size: 16px; border: 0; color: gray;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="border: 1px solid #EAEAEA; border-collapse: collapse; padding: 2px 10px;" height="30px">
                     <img src="img/timeline/ico_alarmc4ca.png" style="vertical-align: middle;">
                     <select>
                                <!-- value는 기수아닌 서수 -->
                             <option value="selectFirst"> 선택해봐 </option>
                             <option value="selectSecond"> 할꺼야 </option>
                             <option value="selectThird"> 말꺼야 </option>
                             <option value="selectFourth"> 어떻게 할꺼야 </option>
                             <option value="selectFifth"> 하기싫어 </option>
                                <!-- value는 기수아닌 서수 -->   
                          </select>
                  </td>
               </tr>



               <tr style="height: 50px;">
                  <td></td>
                  <td align="right">
                     <input type="submit" value="올리기"
                     style="background-color: #5f5ab9; border: #5f5ab9; color: #fff; font-weight: bold; width: 100px; height: 30px;">&nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>


         <!-- 일정 -->
         <!-- 할일 -->
         <div id="TWork">
            <table style="border: 1px solid #EAEAEA; border-collapse: collapse;">
               <tr>
                  <td colspan="2" height="50px" style="vertical-align: middle;">
                     <input id="Schedule_title" type="text" size="95" placeholder="할일 제목을 입력하세요."
                     style="width: 97%; line-height: 18px; font-size: 16px; border: 0; font-weight: bold; color: gray; margin-left: 10px;">
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="padding: 2px 30px;">
                     <div id="Chu_Dowork" style="width:100%;"></div>
                     <a id="plus" onclick="DoDoDo()"><img src="img/timeline/pf_ico4_on.png"> 할일추가</a></td>
               </tr>
               <tr style="height: 50px;">
                  <td></td>
                  <td align="right"><input type="submit" value="올리기"
                     style="background-color: #5f5ab9; border: #5f5ab9; color: #fff; font-weight: bold; width: 100px; height: 30px;">&nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </div>
         <!-- 할일 -->
         <script type="text/javascript">
               function DoDoDo(){
                  var Dowork="";
                  
                  // 할일입력
                  Dowork+="<div style='width=547px; height=46px;'>";
                  Dowork+="<div class=SelWrap>";
                  Dowork+=   "<input type=button value=X class=SelDel>"
                  Dowork+=   "<input type=text placeholder='할일입력(Enter or Tab 선택시 아래에 할일 입력 추가됨)' size=80 'style='height=34px; display: inline;'>";
                  Dowork+=      "<div style='width=100px; height=100px; display: inline-block;'>";
                  Dowork+=      "<input type=text id=DoCal1 size=1 placeholder='일정' style='color:red; font-weight:bold;'>";
                  Dowork+=      "<input type=text id=DoCal2 size=2 placeholder='담당자' style='color:red; font-weight:bold;'>";
                  Dowork+=      "</div>";
                  Dowork+="</div>";
                  Dowork+="</div>";
                  // 할일입력 end
                  $("#Chu_Dowork").append(Dowork);
                  
                  //removeattr("id");
                     $(document).find("input[id=DoCal1]").removeClass("hasDatepicker").attr("id","").datepicker({
                     dateFormat:'mm-dd'
                   });  
                   
                    $("#DoCal2").each(function(){
                       var aa=$(document).find("input[id=DoCal2]").index();
                       //alert(aa);
                  });
                  $(".SelDel").click(function(){
                        $(this).prev().remove(); 
                        $(this).next().remove();
                        $(this).next().remove();
                        $(this).next().remove();
                        $(this).remove();
                  });
               }
         </script>
        <%--  <a href="./FileDownloadAction.tl?file_name=<%=Wbb.getImg_file()%>"><img name="img" style="width:120px; height:auto;"
       src="./upload/<%=Wbb.getImg_file()%>"></a></div><br> --%>
<%-- 		<div id="plusArea" style="">
			<%		
				BoardBean Wbb=new BoardBean();
				BoardDAO Wbdao=new BoardDAO();
				ArrayList<BoardBean> list=Wbdao.Writeinfo();
		
				
				/* for(int Wcon=0; Wcon<list.size(); Wcon++){
					Wbb=list.get(Wcon); */
		
			%>		
			<%
				TotalBean tb=new TotalBean();
				TotalDAO td=new TotalDAO();
				ArrayList<TotalBean> TotalList=td.Totalinfo();
			%>
				<!-- 타임라인 테이블 -->
		        <div id="TimeLineTable" style="border: 3px solid red;">
		        <%
		        	for(int Total=0; Total<TotalList.size(); Total++){
						tb=TotalList.get(Total);
		        %>
		       	<!-- 글 작성 테이블 -->
		       	<div id="WriteForm">
					<% if(tb.getTable().equals("Write")) { %>
						내용 :<%=tb.getContent()%>
					<%}%>
				</div>
				<!-- 업무 작성 테이블 -->
				<div id="DutyForm">
					<%
					if(tb.getDTable().equals("Duty")){
					%>
						제목:<%=tb.getContent()%>
					<%}%>
				</div>
			</div> <!-- 타임라인 테이블 -->
		       <%} %>
	       
	    </div>	 --%>		
    	
    	
    	<%
	    	BoardDAO bdao = new BoardDAO();
    		ArrayList<BoardBean> arr = new ArrayList<BoardBean>();
    		
    		
    		TotalBean tb=new TotalBean();
			TotalDAO td=new TotalDAO();
			ArrayList<TotalBean> TotalList=td.Totalinfo(); // 안함. 나중에 토탈빈으로 바꿔야함.
    		
    		
    		
    		arr = bdao.Writeinfo();
    		
    		if(arr.size() != 0) {
    			for(BoardBean bb: arr) {
    			
    				MemberDAO mdao = new MemberDAO();
    	%>
		    	<div id="time_board">
		    		<% if(bb.getTable_type().equals("Write")) { %>
		            <div id="time_body">
			            <div id="time_profile">
							<img alt="프로필사진" src="./img/right_menu/img_photo_null32.png" id="profile_img">
							<span id="time_info" style="width: 100px;">
								<b><%= mdao.getMember(bb.getMember_user()).getName() %></b><br>
								<span style="color: #c0c0c0;font-size: 12px;"><%=bb.getDate() %></span>
							</span>
			            </div>
			            <div class="clear"></div>
			            
			            <div id="time_content">
			            	<%=bb.getContent() %>
			            	
			            	
			            
			            </div>
			            <div>
			            	<a href="">좋아요</a>
			            	<a href="">댓글달기</a>
			            </div>
			       </div>
			         	
			       
			       <%} %>
		       </div>
		       <div id="mar_btm"></div>
         <%		} 
         	}%>
    
    
    



      </article>


      <jsp:include page="../default/right_menu.jsp"></jsp:include>
   </div>
</body>
</html>