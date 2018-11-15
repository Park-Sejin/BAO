<%@page import="bao.TimeLine.db.DutyDAO"%>
<%@page import="bao.TimeLine.db.DutyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bao.TimeLine.db.BoardDAO"%>
<%@page import="bao.TimeLine.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 구글 Map api 사용하려고 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAtGe_n-epCEfG-V7QP6KP56hMykUp4YE4&v=3.exp&sensor=false&libraries=places"></script>
<!-- Jquery 쓰려고 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- datapicker api 사용하려고-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- datapicker -->
<!-- 
/*!      
 * JQuery UI Datepicker 1.12.1
 * http://jqueryui.com
 * 
 * Copyright 2014 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/datepicker/
 *
 * Depends : 
 *         jquery.ui.core.js
 *
 */
-->
<!-- 
/*!      
 * groupware Project timeline made by EomJaeCheol
 * made with 6 people together
 * if you have any question contact 'abctmxk@naver.com'
 */
-->
<style type="text/css">
textarea::placeholder {
   font-size: 30px;
   color: red;
}

textarea {
   margin-left: 50px;
   margin-top: 20px;
}

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
/* 담당자 추가 */
/* 달력 크기 */
.ui-datepicker{ font-size: 12px; width: 200px; }
.ui-datepicker select.ui-datepicker-month{ width:100px; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:100px; font-size: 11px; }
/* 달력 크기 */
</style>
<script type="text/javascript">
/* $(document).ready(function() {
   
       $("#TDup").hide();
       $("#TCal").hide();
       $("#TWork").hide();
   
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
      $("#TDup").hide();
      $("#TWirte").hide();
      $("#TWork").hide();
   });
   //할일
   $("#Do").click(function() {
      $("#TWork").show();
      $("#TCal").hide();
      $("#TDup").hide();
      $("#TWirte").hide();
   }); */
   /* -------------------------------------------------------------------------- */
   
   /* Modal */
   /* $("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
      $("#my-dialog,#dialog-background").toggle();
   }); */
   /* Modal */
   
   /* textbox 담당자 추가 */
    /*  var dupid;
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
   }); */
    /* textbox 담당자 추가 */
   
   /* 항목추가 입력 */
   /* $("#AddList").click(function(){
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
    /* 항목추가 입력 */
}); */
</script>
<!-- Text 감지 -->
<!-- <script type="text/javascript">
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
 
</script> -->
<!-- Text 감지 -->

<!-- 담당자 삭제 -->
<!-- <script type="text/javascript">
function remove(obj){
   document.getElementById('Chu').removeChild(obj.parentNode);
} -->
</script>
<!-- 담당자 삭제 -->

<!-- <!-- 일정부분 달력  -->
<!-- <script type="text/javascript">
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
   /* 종일 체크버튼 */    -->
</script> -->
<!-- 일정부분 달력  -->

<!-- 장소검색  -->
<!-- <script type="text/javascript">

   function init() {
          var input = document.getElementById('locationTextField');
       var autocomplete = new google.maps.places.Autocomplete(input);
   }
   google.maps.event.addDomListener(window, 'load', init);
</script> -->
<!-- 장소검색  -->

<!-- 할일 > 할일추가 -->
<!-- <script type="text/javascript">
//border: 3px solid blue;
   function DoDoDo(){
//       var Start = $(this).next()
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
</script> -->

<!--할일 > 할일추가  -->
<script type="text/javascript">
</script>
<!--할일 > 할일추가  -->

</head>
<body>
   <!-- <input type="button" value="글" id="write">
   <input type="button" value="업무" id="Dup">
   <input type="button" value="일정" id="Cal">
   <input type="button" value="할일" id="Do"> -->
   <br>
   <!-- 글 -->
   <!-- onsubmit="return formCheck(); -->
 <!--   <form action="" method="post" enctype="multipart/form-data" id="FWriteForm">
         <div style="width: 800px; height: 200px;" id="TWirte">
            <textarea placeholder="글을 작성하세요" rows="10" cols="100" name="content"></textarea><br> -->
              <!--  <div>
                  <input type="file" name="write_file">
                  <input type="file" name="img_file">
               <input type="button" value="올리기" id="uploadbutton">
               </div> -->
<!--          </div>
   </form> -->
   <!-- <script type="text/javascript">
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
             var Write="";
               Write+="<div style='' id=TWirte>";
               Write+="'" + json.WF + "'";
               Write+="'" + Chutext.replace(/\r\n/gi,"<br>") + "'";
               Write+="<br>";
               Write+="</div>";
               $("#plusArea").prepend(Write);
          }
           });
         });
   });
   /* 글 작성 끝 */
   </script> -->
   <!-- 업무  -->
   <!-- <form action="" method="post" enctype="multipart/form-data" id="DutyWriteForm"> -->
         <!-- <div style="width: 800px;" id="TDup"> -->
         <!-- 업무명 -->
        <!-- <div style="border-bottom: 3px solid black;">
           <input id="Val1" name="Duty_title" type="text" placeholder="업무명을 입력하세요" style="border:0; font-weight: bold; height: 30px;" size="40">
        </div> -->
         <!-- 업무명 -->
   
         <!-- 업무명 진행 버튼 -->
         <div style="border-bottom: 3px solid blue;">
            <button>요청</button><button>진행</button><button>피드백</button>
            <button>완료</button><button>보류</button>
         </div>
         <!-- 업무명 진행 버튼-->
         <textarea placeholder="업무 일정을 작성하세요" rows="10" cols="100" name="Duty_content"></textarea>
         <br>
         <div id="Wrap" style="display:inline;min-width:1200px;">
            <!-- 담당자 추가 되는부분 -->
           <div id="Chu" style="min-width:60px; float: left; display:inline;"></div>
            <!-- 담당자 추가 되는부분 -->
           <div class="Dam" id="btn-open-dialog" style="margin-left: 70px; width: 100px; display: inline; float: left;">담당자 추가</div><br>
         </div>
         <!-- 항목추가 -->
      
      <input type="button" value="항목추가 입력" id="AddList">
      <!-- 항목추가 -->
      <!-- 항목추가시 딸려오는 하위 항목들 -->
      <div style="width: 100%; height: auto;" id="AddAdd"></div>
      <!-- 항목추가시 딸려오는 하위 항목들 -->
      <div id="my-dialog">
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
	   </div>
   </form>
   <script type="text/javascript">
   $(document).ready(function(){
        $("#DutyUpload").click(function(){
           var DformData=new FormData($("#DutyWriteForm")[0]);
           $.ajax({
             url:"./TimeLineDutyWriteAction.tl",
             processData: false,
                contentType: false,
                data: DformData,
                type: 'POST',
             success: function(data){
                var json = $.parseJSON(data);
                //alert(json.Con);
                var Dtext=json.DCon;
                var Write="";
                  Write+="<div style='' id=TWirte>";
                  Write+="'" + json.DTitle + "'";
                  Write+="<br>";
                  Write+="'" + Dtext.replace(/\r\n/gi,"<br>") + "'";
                  Write+="<br>";
                  Write+="</div>";
                  $("#plusArea").prepend(Write);
                  //$("#plusArea").append(Write);
               
             }
              });
            });
      });
   </script>
   <!-- 업무 작성 끝 -->
   
<div style="width: 800px; height: 200px;" id="TCal"> -->
      <!-- 일정 -->
         <div style="border-bottom: 3px solid black;">
           <input id="Schedule_title" type="text" placeholder="일정제목을 입력하세요" style="border:0; font-weight: bold; height: 30px;" size="40">
        </div> 
               <input type="text" id="TStart1"><input type="text" id="Sel1">~<input type="text" id="TStart2"><input type="text" id="Sel2"> -->
               <input type="checkbox" id="Status" onclick="Stus()">종일 -->
            <div style="border-bottom: 3px solid black;">
                 <input id="locationTextField" type="text" placeholder="장소를 입력하세요" style="border:none; font-weight: bold; height: 30px;" size="40">
           </div>
            <div style="border-bottom: 3px solid black;">
                 <input id="Memo_sinput" type="text" placeholder="메모를 입력하세요" style="border:none; font-weight: bold; height: 30px;" size="40">
           </div>
                 <select>
                       <!-- value는 기수아닌 서수 -->
                 <option value="selectFirst"> 선택해봐 </option>
                 <option value="selectSecond"> 할꺼야 </option>
                 <option value="selectThird"> 말꺼야 </option>
                 <option value="selectFourth"> 어떻게 할꺼야 </option>
                 <option value="selectFifth"> 하기싫어 </option>
                    <!-- value는 기수아닌 서수    -->
                 </select>
      <!-- 일정 -->
      <!-- 
         is(":checked")와 다르게 써보기
         :focus도 써보자, 좋은기능이니까
       -->
      <br>
   <!-- 할일 -->
   <!-- <div style="width: 800px; height: 200px;" id="TWork"> -->
         <div style="border-bottom: 3px solid black;">
            <input id="Schedule_title" type="text" placeholder="할일제목을 입력하세요(선택)" style="border:none; font-weight: bold; height: 30px;" size="40">
         </div><br>
         <!-- 할일 추가 되는 부분 -->
         <div id="Chu_Dowork" style="width:100%;"></div>
         <!-- <div style="border-bottom: 3px solid black;" id="AddDowork">
            <a onclick="DoDoDo()">할일 추가</a>
         </div> -->
         <!-- 할일 추가 되는 부분 -->
   <!-- 할일 -->   
 
</body>
</html>