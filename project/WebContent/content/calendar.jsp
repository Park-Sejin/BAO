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
	//왼쪽 업무부분 체크 한번만 가능하도록 설정
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("work");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
</script>
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
			<div id="calendar_back">
				<%
				//날짜계산
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH)+1;
				
				//이전월 계산
				int prevYear = year;
				int prevMonth = month-1;
				//1월인 경우 이전년 12월로 지정
				if (prevMonth == 0) {
					prevYear--;
				    prevMonth = 12;
				}
				//다음월 계산
				int nextYear = year;
				int nextMonth = month+1;
				// 12월인 경우 다음년 1월로 지정
				if (nextMonth == 13) {
					nextYear++;
				    nextMonth = 1;
				}
				%>
				<div id="left_btn">
					<a href="./calendar.pr?y=<%=prevYear%>&m=<%=prevMonth%>">◁</a>
					<a href="./calendar.pr?y=<%=nextYear%>&m=<%=nextMonth%>">▷</a>
					<a href="#">오늘</a>
				</div>
				<h1 style="font-weight: bold;"><%=year%>년 <%=month%>월</h1>
				<table id="calendar">
					<tr>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
						<td>일</td>
					</tr>
					<tr>
					<%
					//배치
					cal.set(year,month,1);
					
					//월 시작 요일 
					int startDay = cal.get(Calendar.DAY_OF_WEEK); 
					//월 마지막 날짜
		            int lastDay = cal.getActualMaximum(Calendar.DATE); 
					
					//시작요일 확인
					int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
					
				    // 시작요일까지 이동
				    for (int i=1; i<bgnWeek; i++) out.println("<td>&nbsp;</td>");

				    // 첫날~마지막날까지 처리
				    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
				    while (cal.get(Calendar.MONTH) == month) {
				        out.println("<td>" + cal.get(Calendar.DATE) + "</td>");

				        // 토요일인 경우 다음줄로 생성
				        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) out.println("</tr><tr>");

				        // 날짜 증가시키지
				        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
				    }

				    // 끝날부터 토요일까지 빈칸으로 처리
				    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td>&nbsp;</td>");
					%>
					</tr>
				</table>
			
			</div>
		
		</div>
		
		
	</article>
	
</body>
</html>