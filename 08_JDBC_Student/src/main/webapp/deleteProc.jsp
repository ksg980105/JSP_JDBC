<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp(num) => deleteProc.jsp<br>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>

<% 
int no = Integer.parseInt(request.getParameter("num"));

int cnt= sdao.deleteData(no);  
String msg,url;
if(cnt != -1){
	msg ="삭제 성공";
}else{
	msg="삭제 실패";   
}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="list.jsp";
</script>
