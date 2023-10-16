<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp(8가지) => insertProc.jsp<br>

<!-- form에서 입력한 모든 항목을 BookBean으로 묶어 Dao로 가져가서 insert하기
insert성공하면 list.jsp로 이동
insert실패하면 insertForm.jsp로 이동 -->

<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>
<jsp:useBean id="bb" class="myPkg.BookBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	BookDao bdao = BookDao.getInstance();
	System.out.println("insertProc.jsp bdao:" + bdao);
%>
<%
	String[] temp = request.getParameterValues("bookstore");
	// String[] temp = {"알라딘","yes24"}
	String bookstore = "";
	for(int i=0; i<temp.length; i++){
		bookstore += temp[i] + " "; // bookstore = 알라딘 yes24 
	}
	
	bb.setBookstore(bookstore);
		
	int cnt = bdao.insertData(bb);
	String msg, url;
	if(cnt != -1){
		msg = "삽입 성공";
		url = "list.jsp";
	}else{
		msg = "삽입 실패";
		url = "insertForm.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>










