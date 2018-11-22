<%@page import="chatting.db.ChatBean"%>
<%@page import="chatting.db.ChatDAO"%>
<%@page import="member.db.MemberBean"%>
<%@page import="project.db.ProjectDAO"%>
<%@page import="java.util.List"%>
<%@page import="bao.TimeLine.db.BoardDAO"%>
<%@page import="bao.TimeLine.db.AlarmBean"%>
<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/top.css">
<script>
	$(document).ready(function(){
		var sid = document.getElementById('sid');
		$('#click_chat').click(function(){
			$.ajax({
	            url:'./default/top_test1.jsp',
	            type:'get',
	            data:{
	            	'email':sid
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
		
		$('#click_allck').click(function(){
			alert("dfs");
		});
		
	})
</script>

</head>
<body>
	<%
	String id = (String)session.getAttribute("email");
	%>
	<input type="hidden" value="<%=id%>" name="sid">
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
						<%
							ChatDAO cdao = new ChatDAO();
							MemberDAO hd_mdao = new MemberDAO();
							List chatList = cdao.getChatList(id);
							for(int i=0; i<chatList.size(); i++){
								ChatBean cb = (ChatBean)chatList.get(i);
								MemberBean chatmb = hd_mdao.getMember(cb.getReceiver());
						%>
						<div id="hd_chat_sec3">
							<div class="sec3_div">
								<%if(chatmb.getImage() == null){ %>
									<img src="./img/top_header/thumb26.gif" width="40px"
													height="40px"  class="sec3_div_img">
								<%}else{ %>
									<img src="./upload/<%=chatmb.getImage() %>" width="40px"
													height="40px"  class="sec3_div_img">
								<%} %>
								<span class="sec3_div_name"><a onclick="window.open('./chatPage.chat?receive_email=<%=cb.getReceiver() %>', 'new','width=700, height=870, status=no, location=no, directories=no,scrollbars=no;');"><%=chatmb.getName() %></a></span>
								<span class="sec3_div_title"><a onclick="window.open('./chatPage.chat?receive_email=<%=cb.getReceiver() %>', 'new','width=700, height=870, status=no, location=no, directories=no,scrollbars=no;');"><%=cb.getMessage() %></a></span>
								<span class="sec3_div_date"><%=cb.getDate() %></span>
							</div>
						<%
							}
						
						%>
							
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
				<!-- 알람 기능 -->
				<div id="hd_alarm">
					<div id="hd_alarm_sec1">
						<a href="#" id="click_allalarm">전체알림</a>
					</div>
					
					<div id="hd_alarm_sec2">
						<%
							//알림 리스트 불러오기
							BoardDAO h_bdao = new BoardDAO();
							MemberDAO h_mdao = new MemberDAO();
							ProjectDAO h_pdao = new ProjectDAO();
							int memNum = h_mdao.getMemberNum(id);
							String memName = h_mdao.getName(memNum);
							List AlarmList = (List)h_bdao.alarmList(memNum);
							String proName = "";
							for(int i=0; i<AlarmList.size(); i++){
								AlarmBean ab = (AlarmBean)AlarmList.get(i);
								int proNum = h_bdao.getProNum(ab.getTwrite_num());
								proName = h_pdao.getProjectName(proNum);
								MemberBean mb = h_mdao.getMember( ab.getMember_num());
						%>
                     	<div class="sec3_div">
                     		<img 
                     			<%if(mb.getImage()==null){ %>
                     			src="./img/top_header/thumb26.gif" 
                     			<%}else{ %>
                     			src="./upload/<%=mb.getImage()%> "
                     			<%} %>
                     			width="40px"
										height="40px"  class="sec3_div_img">
							<span class="sec33_div_name"><%=proName %></span>
							<span class="sec33_div_title"><span class="bold"><%=h_mdao.getName(ab.getMember_num()) %></span>님이 글 작성을 했습니다.</span>
							<span class="sec33_div_date"><%=ab.getDate() %> </span>
                    	</div>
                    	<%
                    		}
						%>
                    
                    
                    
                    
                    </div>
                     		
                </div>

			</div> 
		</li>
		
		<li>
			<a id="icon_member"
				<%
					MemberBean mb = h_mdao.getMember(id);
					if(mb.getImage() != null){
						%>
						style="background-image: url('./upload/<%=mb.getImage()%>');"
						<%
					}
				%>
			></a>
			<!-- The Modal -->
			<div id="myModal3" class="modal2">

				<!-- Modal content -->
				<div id="hd_member">
                     	<div class="hd_member_sec1">
                     		<div>
                     			<%
                     				if(mb.getImage()==null){
                     			%>
                     					<img src="./img/top_header/thumb26.gif" width="40px" height="40px" class="rd">
                     			<%
                     				}else{
                     			%>
                     					<img src="./upload/<%=mb.getImage()%>" width="40px" height="40px" class="rd">
                     			<%
                     				}
                     			%>
                     			<br>
                     			<b><%=memName %></b>
                     		</div>
                     	</div>
                     	<hr>
                     	<div class="hd_member_sec2">
                     		<a href="./Set.me">회원정보</a>
                     		<a href="./Logout.me">로그아웃</a>
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
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal1) {
					modal1.style.display = "none";
				}
				if (event.target == modal2) {
					modal2.style.display = "none";
				}
				if (event.target == modal3) {
					modal3.style.display = "none";
				}
			}
			
			
			
			</script>
			
		</li>
	</ul>


	</header>

</body>
</html>