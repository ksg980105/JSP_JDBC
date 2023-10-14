<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="eb" class="myPkg.EmplBean"/>
<jsp:setProperty property="*" name="eb"/>

<jsp:useBean id="ed" class="myPkg.EmplDao"/>

<%
	String msg;
	String url;
	int cnt = ed.updateData(eb);
	if(cnt != -1){
		msg = "수정 성공";
		url = "list.jsp";
	}else{
		msg = "수정 실패";
		url = "updateForm.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>