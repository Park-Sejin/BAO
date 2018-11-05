<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//회원수정 파라미터
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String team = request.getParameter("team");
		String part = request.getParameter("part");
		String position = request.getParameter("position");
		String phone = request.getParameter("phone");
		
		//회원의 기존 정보가져오기
		MemberDAO mdao = new MemberDAO();
		MemberBean mb2 = mdao.getMember(email);
		String name2 =  mb2.getName();
		String mobile2 = mb2.getMobile();
		String team2 = mb2.getTeam();
		String part2 = mb2.getPart();
		String position2 = mb2.getPosition();
		String phone2 = mb2.getPhone();
		
		//넘어온 파라미터값이 기존의 값과 다르면 변경
		MemberBean mb = null;
		if(!name.equals(name2)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name);
			mb.setMobile(mobile2);
			mb.setTeam(team2);
			mb.setPart(part2);
			mb.setPosition(position2);
			mb.setPhone(phone2);
			
		} else if(!mobile.equals(mobile2)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name2);
			mb.setMobile(mobile);
			mb.setTeam(team2);
			mb.setPart(part2);
			mb.setPosition(position2);
			mb.setPhone(phone2);
			
		} else if(!team.equals(team2)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name2);
			mb.setMobile(mobile2);
			mb.setTeam(team);
			mb.setPart(part2);
			mb.setPosition(position2);
			mb.setPhone(phone2);
			
		} else if(!part.equals(part2)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name2);
			mb.setMobile(mobile2);
			mb.setTeam(team2);
			mb.setPart(part);
			mb.setPosition(position2);
			mb.setPhone(phone2);
			
		} else if(!position.equals(position2)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name2);
			mb.setMobile(mobile2);
			mb.setTeam(team2);
			mb.setPart(part2);
			mb.setPosition(position);
			mb.setPhone(phone2);
			
		} else if(!phone.equals(phone)){
			mb = new MemberBean();
			mb.setEmail(email);
			mb.setName(name2);
			mb.setMobile(mobile2);
			mb.setTeam(team2);
			mb.setPart(part2);
			mb.setPosition(position2);
			mb.setPhone(phone);
		}
		
		//회원정보수정
		mdao.updateMember(mb);
		
%>


