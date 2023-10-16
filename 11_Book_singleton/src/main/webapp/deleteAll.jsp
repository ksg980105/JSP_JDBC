<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>
<!-- 선택한 여러줄 삭제 -->
<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>
<%
	BookDao bdao = BookDao.getInstance();
	System.out.println("deleteAll.jsp bdao:" + bdao);
%>
<%
	String[] rowcheck = request.getParameterValues("rowcheck");
	for(int i=0; i<rowcheck.length; i++){
		System.out.print(rowcheck[i]+" ");
	}
	
	int cnt = bdao.deleteCheckData(rowcheck);
	
	String msg;
	
	if(cnt != -1){
		msg = "삭제 완료";
	}else{
		msg = "삭제 실패";
	}
	
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="list.jsp";
</script>

