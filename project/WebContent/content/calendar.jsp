<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/calendar.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//업무부분 체크 한번만 가능하도록 설정
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("work");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	$(document).ready(function(){	
		//체크박스 선택시 해당일정 가져오기
		//내가 등록한 일정
		var schedule = 0;
		$("#schedule1").on("click",function(){
			if($(this).is(":checked")){
				schedule = 1;
				alert(schedule);
				
				$.ajax({
					type: "POST",
					url: "./CalendarAction.pr",
					data:{
						"email":email,
						"alram":alram
					},
					dataType : "text",
			        error : function(){
						alert('통신실패!!');
					},
			        success: function(data){
			        	alert("설정변경");
			        }
				}); 
				
			} else{
				schedule = 0;
				alert(schedule);
			}
		});
		//초대받은 일정
		$("#schedule2").on("click",function(){
			if($(this).is(":checked")){
				alert("체크");
			} else{
				alert("해제");
			}
		});
		//내업무
		$("#work1").on("click",function(){
			if($(this).is(":checked")){
				alert("체크");
			} else{
				alert("해제");
			}
		});
		//요청한 업무
		$("#work2").on("click",function(){
			if($(this).is(":checked")){
				alert("체크");
			} else{
				alert("해제");
			}
		});
		//전체업무
		$("#work3").on("click",function(){
			if($(this).is(":checked")){
				alert("체크");
			} else{
				alert("해제");
			}
		});
		
		//오늘버튼누르면 오늘 체크되도록
		$("#today").on("click",function(){
			var now = new Date();

			var year= now.getFullYear();
			var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
			var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
			              
			var chan_val = year + '-' + mon + '-' + day;
			//$(this).val(chan_val);
			alert(chan_val);
		});
	});
</script>
<!-- 달력부분 -->
<script type="text/javascript">
   $(document).ready(function(){
      calendar();
   });
</script>
<script type="text/javascript">
	var nowDate;
	var nYear;
	var nMonth;
	var nDate;
	var nNumday;
	var endDay;
	var dayName;
	var col;
	var eDate = new Date();

	function calendar(tYear,tMonth) {
		nowDate = new Date();
		nYear=nowDate.getFullYear();
		nMonth= nowDate.getMonth();
		nDate= nowDate.getDate();
		nNumday= nowDate.getDay();
		endDay= new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		dayName= new Array("일", "월", "화", "수", "목", "금", "토");
		col=0;

		if (tYear == null) {
			tYear = nYear;
		}   

		if (tMonth == null) {
			tMonth = nMonth;
		}   
           
		eDate.setFullYear(tYear); 
		eDate.setMonth(tMonth);  
		eDate.setDate(1); 
		var fNumday = eDate.getDay();   
		var lastDay = endDay[eDate.getMonth()]; 

		if ((eDate.getMonth() == 1) && (((eDate.getYear() % 4 == 0) && (eDate.getYear() % 100 != 0)) || eDate.getYear() % 400 == 0)) {
			lastDay = 29;
		}  
		
		
		//달력
		calendarStr = "<TABLE class=MainT>"
		calendarStr += "<TR valign=bottom><TD>"
		//지난달 다음달 이동
		calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth - 1) + ") onclick='Preview(tMonth-1,tYear)' class=preNext>◀</a>"
		calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth + 1) + ") onclick='Postview(eDate.getMonth()+1,eDate.getFullYear())' class=preNext id=post>▶</a>"
		calendarStr += "</TD><TD colspan=5 align=center>"
		// 해당하는 년도와 월 표시 
		calendarStr += "<font size=5 color=black>  <b>" + eDate.getFullYear() + "년 " + (eDate.getMonth() + 1) + "월</b></font> "  
		calendarStr += "</TD><TD align=right>"
		//오늘
		calendarStr += "<a href=javascript:calendar(" + tYear + "," + tMonth + ") onclick='' class=preNext>오늘</a>"
 		calendarStr += "</TD></TR>"
 		calendarStr += "<TR height=20px><TD colspan=7></TD></TR>"
		calendarStr += "<TR>"
		
		for (i = 0; i < dayName.length; i++) {
			calendarStr += "<TD class=week>" + dayName[i] + "</TD>" 
		}
		
		calendarStr += "</TR><TR>"
		
		for (i = 0; i < fNumday; i++) { 
			calendarStr += "<TD class=workday>&nbsp;</TD>"
			col++;
		}
		for (i = 1; i <= lastDay; i++) {    
			if (eDate.getFullYear() == nYear && eDate.getMonth() == nMonth && i == nDate) { 
				calendarStr += "<TD class=today >" + i + "</TD>"
			} else {
				if (col == 0) {  
					calendarStr += "<TD class=sunday>" + i + "</TD>"
				} else if (1 <= col && col <= 5) { 
					calendarStr += "<TD class=workday>" + i + "</TD>"
				} else if (col == 6) {  
					calendarStr += "<TD class=satday>" + i + "</TD>"
				}
			}

			col++;

			if (col == 7) { 
				calendarStr += "</TR><TR>"
				col = 0;
			}
		}

		for (i = col; i < dayName.length; i++) { 
			calendarStr += "<TD class=workday>&nbsp;</TD>"
		}

		calendarStr += "</TR></TABLE>"
		document.getElementById('main_calender').innerHTML = calendarStr 
	}
</script>
<!-- 달력부분 -->
</head>
<body>
	<!-- 상단삽입 -->
	<jsp:include page="../default/top3.jsp"></jsp:include>
	
	<div class="clear"></div>
	<article>
		<!-- left side -->
		<div id="LeftHeaderBody">
			<div id="LeftHeaderDl">
				<dl>
					<dt>일정</dt>
					<dd>
						<input type="checkbox" name="schedule" id="schedule1">
						<label for="schedule1"><span>내가 등록한 일정</span></label>
					</dd>
					<dd>
						<input type="checkbox" name="schedule" id="schedule2">
						<label for="schedule2"><span>초대받은 일정</span></label>
					</dd>
				</dl>
			</div>
			<div id="LeftHeaderDl">
				<dl>
					<dt>업무</dt>
					<dd>
						<input type="checkbox" name="work" id="work1" onclick="doOpenCheck(this);">
						<label for="work1"><span>내 업무</span></label>
					</dd>
					<dd>
						<input type="checkbox" name="work" id="work2" onclick="doOpenCheck(this);">
						<label for="work2"><span>요청한 업무</span></label>
					</dd>
					<dd>
						<input type="checkbox" name="work" id="work3" onclick="doOpenCheck(this);">
						<label for="work3"><span>전체 업무</span></label>
					</dd>
				</dl>
			</div>
		</div>
		
		<!-- content -->
		<div id="content">
			<h1>전체 일정</h1>
			<a id="close" href="./main.pr">닫기 X</a>
			<!-- 달력표시  -->
			<div id="main_calender"></div>
		</div>
		
	</article>
	
</body>
</html>