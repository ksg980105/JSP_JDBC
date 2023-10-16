<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp <br>
<jsp:useBean id="bdao" class="myPkg.BookDao"/>
<%
	System.out.println("deleteAll.jsp bdao:" + bdao);
%>
<%
	String msg;
	
	int no = Integer.parseInt(request.getParameter("no"));
	int cnt = bdao.deleteData(no);
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