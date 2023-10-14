<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="myPkg.StudentDao"></jsp:useBean>

<%
	String userid = request.getParameter("userid");
	System.out.println(userid);
	
	boolean isCheck = sdao.searchId(userid);
	String str = "";
	if(isCheck){
		str = "NO";
		out.print(str); //요청한쪽으로 응답의 형태로 작업 insertForm의 ajax data로 들어감
	}else{
		str = "YES";
		out.print(str);
	}
%>