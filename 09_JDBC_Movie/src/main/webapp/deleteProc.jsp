<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="myPkg.MovieDao"/>

<%
	int num = Integer.parseInt(request.getParameter("no"));
	int cnt = mdao.deleteData(num);
	
	if(cnt != -1){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("list.jsp");
	}
%>