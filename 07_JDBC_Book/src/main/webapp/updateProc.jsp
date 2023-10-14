<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp => updateProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="bdao" class="myPkg.BookDao"/>
<jsp:useBean id="bb" class="myPkg.BookBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	System.out.println("updateProc.jsp bdao:" + bdao);
%>
<%
	String[] str = request.getParameterValues("bookstore");
	String bookstore = "";
		for(int i=0; i<str.length; i++){
		  bookstore += str[i] + " ";	 
		}
	bb.setBookstore(bookstore); 
	
	int cnt = bdao.updateData(bb); 
	
	String msg;
	String url;
	
	if(cnt==-1){
		msg="실패";
		url="updateForm.jsp?no="+ bb.getNo();
	}else{
		msg="수정 성공";
		url="list.jsp";
	}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>