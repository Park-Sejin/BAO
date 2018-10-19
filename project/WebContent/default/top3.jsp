<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="./css/style.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
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
		<div style="margin-left: 406px; margin-top:10px; ">
			<table>
				<tr>
					<td width="370px"><a href=""><img src="./img/top_header/logomark2.png" width="50px" height="50px"></a></td>
					<td>
						<form action="">
							<input type="text" size="80" style="line-height: 40px; border:none; border-bottom:1.5px solid silver;" placeholder="전체에서 검색">
							<input type="submit" class="hide">
						</form>
					</td>
					<td width="500px"></td>
					<td>
						<div class="test1">
							<a><img src="./img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa1">
								<div id="aa1_sec1">
									<a href="#">채팅</a> <a href="#">연락처</a> <a id="a3" href="#">+</a>
								</div>
								<hr>
								<div id="aa1_sec2">
									<form action="">
										<input type="text" placeholder="  이름 또는 채팅방 검색" size="40"
											style="line-height: 25px; border-radius: 20px;"> <input
											type="submit" class="hide">
									</form>
								</div>

								<div id="aa1_sec3">

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>

									<div class="sec3_div">
										<div class="dd">
											<div class="sec3_chat">
												<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
													class="f_l rd">
												<div class="sec3_name">
													<!-- 이름 -->
													김철수
												</div>
												<div class="sec3_con">
													<!-- 대화 내용 -->
													안녕하세요 ^^
												</div>
												<div class="sec3_date">
													<!-- 날짜 -->
													2018-10-08
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="test2">
							<a><img src="./img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa2">
								<div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>
									<div class="sec3_div">
										<div class="dd">
											<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
												class="f_l rd">
											<div>
												<div class="sec3_name">'BAO' 업무 공유방</div>
												<div class="sec3_con">김철수님이 댓글을 등록했습니다.</div>
												<div class="sec3_date">2018-10-05 | 17:11</div>

											</div>
										</div>
									</div>



								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="test3">
							<a><img src="./img/top_header/ico_top_alram_offc4ca.png"></a>
							<div id="aa3">
								<div class="aa3_sec1">
									<div>
										<img src="./img/top_header/thumb26.gif" width="40px" height="40px"
											class="rd"> <br> <b>류수재</b>
									</div>
								</div>
								<hr>
								<div class="aa3_sec2">
									<a href="./UpdateMember.me">회원정보</a> <a href="#">로그아웃</a> <a href="#">도움말</a>
								</div>
							</div>
						</div>
					</td>
					<td width="600px"></td>


				</tr>

			</table>
		</div>
	</div>

</body>
</html>