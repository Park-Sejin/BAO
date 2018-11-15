<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="bao.TimeLine.db.DutyBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List workList = (List)request.getAttribute("workList");
	
	JSONArray work = new JSONArray();
	for(int i=0;i<workList.size();i++){
		JSONObject obj = new JSONObject();
		DutyBean db = (DutyBean)workList.get(i);
		obj.put("title", db.getDuty_title());
		obj.put("date", db.getDate());
		
		work.add(obj);
	}

%>
<%=work%>