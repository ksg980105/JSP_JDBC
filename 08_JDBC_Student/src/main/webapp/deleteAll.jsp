<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<%
	String[] rowcheck = request.getParameterValues("rowcheck");
	
	for(int i=0; i<rowcheck.length; i++){
		System.out.print(rowcheck[i]+" ");
	} 
	 
	int cnt = sdao.deleteCheckData(rowcheck);
	String msg;
    
    if(cnt != -1){
    	msg="부분삭제 성공";
    } else{
    	msg="부분삭제 실패";
    }
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="list.jsp";
</script>
