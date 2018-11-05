<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/top.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#click_chat').click(function(){
			$.ajax({
	            url:'./default/top_test1.jsp',
	            type:'get',
	            data:{
	            	'id':'admin'
	            },
	            success:function(data){
	            	$('#chat_block').empty();
	            	$('#chat_block').append(data);
	            }
	        })
		});
		
		$('#click_number').click(function(){
			$.ajax({
	            url:'./default/top_test2.jsp',
	            type:'get',
	            data:{
	            	'id':'admin'
	            },
	            success:function(data){
	            	$('#chat_block').empty();
	            	$('#chat_block').append(data);
	            }
	        })
		});
		
		$('#click_plus').click(function(){
			alert("dfs");
		});
		$('#click_nockalarm').click(function(){
			$.ajax({
	            url:'./default/top_test3.jsp',
	            type:'get',
	            data:{
	            	'id':'admin'
	            },
	            success:function(data){
	            	$('#hd_alarm_sec2').empty();
	            	$('#hd_alarm_sec2').append(data);
	            }
	        })
		});
		$('#click_allalarm').click(function(){
			$.ajax({
	            url:'./default/top_test4.jsp',
	            type:'get',
	            data:{
	            	'id':'admin'
	            },
	            success:function(data){
	            	$('#hd_alarm_sec2').empty();
	            	$('#hd_alarm_sec2').append(data);
	            }
	        })
		});
		
		$('#click_allck').click(function(){
			alert("dfs");
		});
		
	})
</script>

</head>
<body>
	<header>
	<a href="./main.pr"></a>

	<Div id="search">
		<form action="./search.pr">
			<select id="search_type" name="search_type1">
				<option name="all" value="all">ALL</option>
				<option name="project" value="project">프로젝트</option>
				<option name="wirte" value="write">글</option>
				<option name="member" value="member">참여자</option>
			</select>

			<input type="text" placeholder="전체에서 검색" id="search_text" name="keyword"> 
			<input type="submit" style="display: none; border-radius: 10px;">
		</form>
	</Div>

	<ul id="header_icon">
		<li>
			<a id="icon_chat"></a> 
			<!-- The Modal -->
			<div id="myModal1" class="modal2">

				<!-- Modal content -->
				<div id="hd_chat">
					<div id="hd_chat_sec1">
						<a href="#" id="click_chat">채팅</a> <a href="#" id="click_number">연락처</a> <a href="#" id="click_plus">+</a>
					</div>
					<hr>
					<div id="chat_block">
						<div id="hd_chat_sec2">
							<div id="chat_search">
								<form action="">
									<img src="./img/top_header/if_icon-111-search_314478.png" width="30" style="position: absolute; left: 10px;">
									<input type="text" placeholder="이름 또는 채팅방 검색" size="50"
											style=" margin-left:5px;  line-height: 30px;  outline: none; position: absolute; left: 50px; border: none;"> 
									<input type="submit" style="display: none;">
								</form>
							</div>
						</div>
	
						<div id="hd_chat_sec3">
						
							<div class="sec3_div">
								<img src="./img/top_header/thumb26.gif" width="40px"
												height="40px"  class="sec3_div_img">
								<span class="sec3_div_name">김철수</span>
								<span class="sec3_div_title">안녕하세요</span>
								<span class="sec3_div_date">2018.10.25</span>
							</div>
						
							<div class="sec3_div">
								<img src="./img/top_header/thumb26.gif" width="40px"
												height="40px"  class="sec3_div_img">
								<span class="sec3_div_name">김철수</span>
								<span class="sec3_div_title">안녕하세요</span>
								<span class="sec3_div_date">2018.10.25</span>
							</div>
							
							<div class="sec3_div">
								<img src="./img/top_header/thumb26.gif" width="40px"
												height="40px"  class="sec3_div_img">
								<span class="sec3_div_name">김철수</span>
								<span class="sec3_div_title">안녕하세요</span>
								<span class="sec3_div_date">2018.10.25</span>
							</div>
							
							<div class="sec3_div">
								<img src="./img/top_header/thumb26.gif" width="40px"
												height="40px"  class="sec3_div_img">
								<span class="sec3_div_name">김철수</span>
								<span class="sec3_div_title">안녕하세요</span>
								<span class="sec3_div_date">2018.10.25</span>
							</div>
							
							<div class="sec3_div">
								<img src="./img/top_header/thumb26.gif" width="40px"
												height="40px"  class="sec3_div_img">
								<span class="sec3_div_name">김철수</span>
								<span class="sec3_div_title">안녕하세요</span>
								<span class="sec3_div_date">2018.10.25</span>
							</div>
							
							
							
						</div>
					</div>
				</div>

			</div> 
		</li>
			
		<li>
			<a id="icon_alarm"></a>
			<!-- The Modal -->
			<div id="myModal2" class="modal2">

				<!-- Modal content -->
				<div id="hd_alarm">
					<div id="hd_alarm_sec1">
						<a href="#" id="click_nockalarm">미확인알림</a>
						<a href="#" id="click_allalarm">전체알림</a>
						<a href="#" id="click_allck">모두 읽음</a>
					</div>
					
					<div id="hd_alarm_sec2">
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    	
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    	
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    	
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    	
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    	
                     	<div class="sec3_div">
                     		<img src="./img/top_header/thumb26.gif" width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec3_div_name">프로젝트 명 </span>
							<span class="sec3_div_title"><span class="bold">김철수</span> 님이 댓글을 등록했습니다.</span>
							<span class="sec3_div_date">7시간 전 </span>
                    	</div>
                    
                    
                    
                    
                    </div>
                     		
                </div>

			</div> 
		</li>
		
		<li>
			<a id="icon_member"></a>
			<!-- The Modal -->
			<div id="myModal3" class="modal2">

				<!-- Modal content -->
				<div id="hd_member">
                     	<div class="hd_member_sec1">
                     		<div>
                     			<img src="./img/top_header/thumb26.gif" width="40px" height="40px" class="rd">
                     			<br>
                     			<b>류수재</b>
                     		</div>
                     	</div>
                     	<hr>
                     	<div class="hd_member_sec2">
                     		<a href="#">회원정보</a>
                     		<a href="#">로그아웃</a>
                     		<a href="#">도움말</a>
                     	</div>
               </div>
			</div> 
			<script>
			// Get the modal
			var modal1 = document.getElementById('myModal1');

			// Get the button that opens the modal
			var btn1 = document.getElementById("icon_chat");

			// When the user clicks the button, open the modal 
			btn1.onclick = function() {
				modal1.style.display = "block";
			}

			// Get the modal
			var modal2 = document.getElementById('myModal2');

			// Get the button that opens the modal
			var btn2 = document.getElementById("icon_alarm");

			// When the user clicks the button, open the modal 
			btn2.onclick = function() {
				modal2.style.display = "block";
			}
			
			// Get the modal
			var modal3 = document.getElementById('myModal3');

			// Get the button that opens the modal
			var btn3 = document.getElementById("icon_member");

			// When the user clicks the button, open the modal 
			btn3.onclick = function() {
				modal3.style.display = "block";
			}

			</script>
			
		</li>
	</ul>


	</header>

</body>
</html>