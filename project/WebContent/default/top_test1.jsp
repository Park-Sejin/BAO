<%@page import="member.db.MemberBean"%>
<%@page import="chatting.db.ChatBean"%>
<%@page import="java.util.List"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="chatting.db.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
						String id = (String)session.getAttribute("email");
							ChatDAO cdao = new ChatDAO();
							MemberDAO hd_mdao = new MemberDAO();
							List chatList = cdao.getChatList(id);
							for(int i=0; i<chatList.size(); i++){
								ChatBean cb = (ChatBean)chatList.get(i);
								MemberBean chatmb = hd_mdao.getMember(cb.getReceiver());
						%>
						<input type="hidden" id="receive_email" value="<%=cb.getReceiver()%>">
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

