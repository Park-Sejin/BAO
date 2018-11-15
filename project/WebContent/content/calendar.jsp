<%@page import="java.util.List"%>
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
	
	//내가 등록한 일정 체크박스 적용
	function schedule1Set(){
		//이메일값 받아오기
		var email = document.getElementsByName("email")[0].value;
		var schedule1 = 0;
		if($("#schedule1").is(":checked")){
			schedule1 = 1;
		} else if(!$("#schedule1").is(":checked")){
			schedule1 = -1;
		}
		$.ajax({
			type: "POST",
			url: "./calendarAction.pr",
			data:{
				"email":email,
				"schedule1":schedule1
			},
			dataType : "text",
	        error : function(){
				alert('통신실패!!');
			},
	        success: function(data){
	        	//alert("설정변경");
	        }
		}); 
	}

	//초대받은 일정 체크박스 적용
	function schedule2Set(){
		//이메일값 받아오기
		var email = document.getElementsByName("email")[0].value;
		var schedule2 = 0;
		if($("#schedule2").is(":checked")){
			schedule2 = 1;
		} else if(!$("#schedule2").is(":checked")){
			schedule2 = -1;
		}
		$.ajax({
			type: "POST",
			url: "./calendarAction.pr",
			data:{
				"email":email,
				"schedule2":schedule2
			},
			dataType : "text",
	        error : function(){
				alert('통신실패!!');
			},
	        success: function(data){
	        	//alert("설정변경");
	        }
		}); 
	}
	
	
	function workSet(chk){
		//업무부분 체크 한번만 가능하도록 설정
	    var obj = document.getElementsByName("work");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	    
		//업무 체크박스 설정 DB 저장
		var email = document.getElementsByName("email")[0].value;
		var work = null;
		if($("#work1").is(":checked")){
			work = obj[0].value;
		} else if($("#work2").is(":checked")){
			work = obj[1].value;
		} else if($("#work3").is(":checked")){
			work = obj[2].value;
		} 
		$.ajax({
			type: "POST",
			url: "./calendarJSON.pr",
			data:{
				"email":email,
				"work":work
			},
			dataType:'json',
	        success: function(json){
	        		/*var title = data.split(",")[0];
				var date = data.split(",")[1];
				alert(title);*/
				
				/* $.each(data,function(index,item){
					var rs="";
					rs.append(item.title+":"+item.date+", ");
					//$('table').append("<tr><td>"+item.title+"</td><td>"+item.gender+"</td><td>"+item.age+"</td></tr>");
				});
				console.log(rs); */
				$.each(json, function(index, item){
				       //alert(item.title + ":" +item.date);
				       
				       //객체를 가져다가 파싱
				       var title = item.title;
				       var date = item.date;
				       alert(title);
				       alert(date);
				});

	        },
	        error : function(){
				alert('통신실패!!');
			}
	        
	        
		});
	}	
	
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

		//2월 윤년체크
		if ((eDate.getMonth() == 1) && (((eDate.getYear() % 4 == 0) && (eDate.getYear() % 100 != 0)) || eDate.getYear() % 400 == 0)) {
			lastDay = 29;
		}  
		
		//달력
		calendarStr = "<TABLE class=MainT>"
		calendarStr += "<TR valign=bottom><TD>"
		//지난달 다음달 이동
		calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth - 1) + ") class=preNext>◀</a>"
		calendarStr += "<a href=javascript:calendar(" + tYear + "," + (tMonth + 1) + ") class=preNext id=post>▶</a>"
		calendarStr += "</TD><TD colspan=5 align=center>"
		// 해당하는 년도와 월 표시 
		calendarStr += "<font size=5 color=black>  <b>" + eDate.getFullYear() + "년 " + (eDate.getMonth() + 1) + "월</b></font> "  
		calendarStr += "</TD><TD align=right>"
		//오늘
		calendarStr += "<a href=javascript:calendar(" + nYear + "," + nMonth + ") class=preNext>오늘</a>"
 		calendarStr += "</TD></TR>"
 		calendarStr += "<TR height=20px><TD colspan=7></TD></TR>"
		calendarStr += "<TR>"
		
		//요일표시
		for (i = 0; i < dayName.length; i++) {
			calendarStr += "<TD class=week>" + dayName[i] + "</TD>" 
		}
		calendarStr += "</TR><TR>"
		//이번달의 비어있는 칸 표시
		for (i = 0; i < fNumday; i++) { 
			calendarStr += "<TD class=workday>&nbsp;</TD>"
			col++;
		}
		//이번달 날짜표시
		for (i = 1; i <= lastDay; i++) {    
			if (eDate.getFullYear() == nYear && eDate.getMonth() == nMonth && i == nDate) { 
				//오늘
				calendarStr += "<TD class=today>" + i + "<BR>"
				//DB에 해당 날짜의 일정이 있으면 삽입
				//if(스케줄1==i){calendarStr += "<DIV class=viewSched pink><a href='"+일정번호+"'>"+일정제목+"</a></DIV>"}
				//if(스케줄2==i){calendarStr += "<DIV class=viewSched orange><a href='"+일정번호+"'>"+일정제목+"</a></DIV>"}
				//if(일정1==i){calendarStr += "<DIV class=viewSched yellow><a href='"+일정번호+"'>"+일정제목+"</a></DIV>"}
				//if(일정2==i){calendarStr += "<DIV class=viewSched green><a href='"+일정번호+"'>"+일정제목+"</a></DIV>"}
				//if(일정3==i){calendarStr += "<DIV class=viewSched sky><a href='"+일정번호+"'>"+일정제목+"</a></DIV>"}
				calendarStr += "<DIV class=viewSched><a href='"+"'>"+i+"</a></DIV>"
				calendarStr += "</TD>"
			} else {
				if (col == 0) {  
					//일요일
					calendarStr += "<TD class=sunday>" + i + "<BR>"
					//DB에 해당 날짜의 일정이 있으면 삽입
					calendarStr += "</TD>"
				} else if (1 <= col && col <= 5) { 
					//평일
					calendarStr += "<TD class=workday>" + i + "<BR>"
					//DB에 해당 날짜의 일정이 있으면 삽입
					calendarStr += "</TD>"
				} else if (col == 6) {  
					//토요일
					calendarStr += "<TD class=satday>" + i + "<BR>"
					//DB에 해당 날짜의 일정이 있으면 삽입
					calendarStr += "</TD>"
				}
			}

			col++;
			//일주일마다 칸 나누기
			if (col == 7) { 
				calendarStr += "</TR><TR>"
				col = 0;
			}
		}
		//남은 빈칸 표시
		for (i = col; i < dayName.length; i++) { 
			calendarStr += "<TD class=workday>&nbsp;</TD>"
		}
		calendarStr += "</TR></TABLE>"
		
		//달력나타내기
		document.getElementById('main_calender').innerHTML = calendarStr 
	}
</script>
<!-- 달력부분 -->
</head>
<body>
	<!-- 상단삽입 -->
	<jsp:include page="../default/top_in.jsp"></jsp:include>
	
	<div class="clear"></div>
	<article>
	<%
	//저장된 설정 값 받아오기
	String email = (String)request.getAttribute("email");
	String work = (String)request.getAttribute("work"); 
	System.out.println("work : "+work);
	//int형변환
	String schedule1_S = (String)request.getAttribute("schedule1");
	int schedule1 = 0;
	if(schedule1_S != null){
		schedule1 = Integer.parseInt(schedule1_S);
	}
	String schedule2_S = (String)request.getAttribute("schedule2");
	int schedule2 = 0;
	if(schedule2_S != null){
		schedule2 = Integer.parseInt(schedule2_S);
	}
	%>
	<input type="hidden" name="email" value="<%=email%>">
		<!-- left side -->
		<div id="LeftHeaderBody">
			<div class="LeftHeaderDl">
				<dl>
					<dt>일정</dt>
					<dd>
				<%	//내가 등록한 일정 설정값 가져오기
					if(schedule1 == 1){
						//List schedule1List = (List)request.getAttribute("schedule1List");
						%>
						<input type="checkbox" name="schedule" id="schedule1" onclick="schedule1Set()" checked="checked">
						<label for="schedule1"><span>내가 등록한 일정</span></label>
						<%
					} else {
						%>
						<input type="checkbox" name="schedule" id="schedule1" onclick="schedule1Set()">
						<label for="schedule1"><span>내가 등록한 일정</span></label>
				<% } %>
					</dd>
					<dd>
				<%	//초대받은 일정 설정값 가져오기
					if(schedule2 == 1){
						//List schedule2List = (List)request.getAttribute("schedule2List");
						%>
						<input type="checkbox" name="schedule" id="schedule2" onclick="schedule2Set()" checked="checked">
						<label for="schedule2"><span>초대받은 일정</span></label>
						<%
					} else {
						%>
						<input type="checkbox" name="schedule" id="schedule2" onclick="schedule2Set()">
						<label for="schedule2"><span>초대받은 일정</span></label>
				<% } %>
						
					</dd>
				</dl>
			</div>
			<div class="LeftHeaderDl">
				<dl>
					<dt>업무</dt>
				<%
					if(work != null){
						//디비에 저장된 체크값 가져오기
						if(work.equals("내 업무")){
							%>
							<dd>
								<input type="checkbox" name="work" value="내 업무" id="work1" onclick="workSet(this)" checked="checked">
								<label for="work1"><span>내 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="요청한 업무" id="work2" onclick="workSet(this)">
								<label for="work2"><span>요청한 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="전체 업무" id="work3" onclick="workSet(this)">
								<label for="work3"><span>전체 업무</span></label>
							</dd>
							<%
						} else if(work.equals("요청한 업무")){
							%>
							<dd>
								<input type="checkbox" name="work" value="내 업무" id="work1" onclick="workSet(this)">
								<label for="work1"><span>내 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="요청한 업무" id="work2" onclick="workSet(this)" checked="checked">
								<label for="work2"><span>요청한 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="전체 업무" id="work3" onclick="workSet(this)">
								<label for="work3"><span>전체 업무</span></label>
							</dd>
							<%
						} else if(work.equals("전체 업무")){
							%>
							<dd>
								<input type="checkbox" name="work" value="내 업무" id="work1" onclick="workSet(this)">
								<label for="work1"><span>내 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="요청한 업무" id="work2" onclick="workSet(this)">
								<label for="work2"><span>요청한 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="전체 업무" id="work3" onclick="workSet(this)" checked="checked">
								<label for="work3"><span>전체 업무</span></label>
							</dd>
							<%
						} else {
							%>
							<dd>
								<input type="checkbox" name="work" value="내 업무" id="work1" onclick="workSet(this)">
								<label for="work1"><span>내 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="요청한 업무" id="work2" onclick="workSet(this)">
								<label for="work2"><span>요청한 업무</span></label>
							</dd>
							<dd>
								<input type="checkbox" name="work" value="전체 업무" id="work3" onclick="workSet(this)">
								<label for="work3"><span>전체 업무</span></label>
							</dd>
							<%
						}
						
					} else {
						%>
					<dd>
						<input type="checkbox" name="work" value="내 업무" id="work1" onclick="workSet(this)">
						<label for="work1"><span>내 업무</span></label>
					</dd>
					<dd>
						<input type="checkbox" name="work" value="요청한 업무" id="work2" onclick="workSet(this)">
						<label for="work2"><span>요청한 업무</span></label>
					</dd>
					<dd>
						<input type="checkbox" name="work" value="전체 업무" id="work3" onclick="workSet(this)">
						<label for="work3"><span>전체 업무</span></label>
					</dd>
				<% } %>
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