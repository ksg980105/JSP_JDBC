<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
	EmplDao dao = new EmplDao();
	String msg;

	int mid = Integer.parseInt(request.getParameter("mid"));
	int cnt = dao.deleteData(mid);
	if(cnt != -1){
		msg = "삭제 성공";
	}else{
		msg = "삭제 실패";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="list.jsp";
</script>