<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="myPkg.MovieDao"></jsp:useBean>

<%
	String userid = request.getParameter("userid");
	
	boolean isCheck = mdao.searchId(userid);
	String str = "";
	if(isCheck){
		str = "NO";
		out.print(str);
	}else{
		str = "YES";
		out.print(str);
	}
%>