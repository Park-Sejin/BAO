<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".test1>#aa1").hide();
		$(".test1>a").click(function() {
			$("#aa1").toggle();
		});
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".test2>#aa2").hide();
		$(".test2>a").click(function() {
			$("#aa2").toggle();
		});
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".test3>#aa3").hide();
		$(".test3>a").click(function() {
			$("#aa3").toggle();
		});
	});
</script>
</head>
<body>
	<div class="service_header">
		<div style="margin-left: 350px;">
			<table>
				<tr>
					<td width="100px"><a href=""><img src="img/top_header/logo.png"
							width="75px" height="75px"></a></td>
					<td>
						<form action="">
							<input type="text" id="okff" size="80" style="line-height: 40px;"
								placeholder="전체에서 검색"> <input type="submit" class="hide">
						</form>
					</td>
					<td width="400px"></td>
					<td>
						<div class="test1">
							<a><img src="img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa1">
								<a>채팅</a> <a>연락처</a> <a>+</a>
								<hr>
								<form action="">
									<input type="text" placeholder="이름 또는 채팅방 검색"> <input
										type="submit" class="hide">
								</form>
								<div>박수진 뷰티풀부산</div>
							</div>
						</div>
					</td>
					<td>
						<div class="test2">
							<a><img src="img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa2">test2</div>
						</div>
					</td>
					<td>
						<div class="test3">
							<a><img src="img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa3">test3</div>
						</div>
					</td>
					<td width="600px"></td>


				</tr>

			</table>
		</div>
	</div>

</body>
</html>