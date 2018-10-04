<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link href="css/timeline.css" rel="stylesheet" type="text/css">
		
	</head>
	<body>
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
						<li><span class="chart1"></span> 요청		<strong> n건 </strong>	<span class="chart1">n%</span></li>
						<li><span class="chart2"></span> 진행		<strong> n건 </strong>	<span class="chart2">n%</span></li>
						<li><span class="chart3"></span> 피드백	<strong> n건 </strong>	<span class="chart3">n%</span></li>
						<li><span class="chart4"></span> 완료		<strong> n건 </strong>	<span class="chart4">n%</span></li>
						<li><span class="chart5"></span> 보류		<strong> n건 </strong>	<span class="chart5">n%</span></li>
					</ul>
				</div>
			</div>
		
		</article>
	</body>
</html>