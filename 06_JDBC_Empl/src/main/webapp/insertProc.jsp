<%@page import="myPkg.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	/* String name = request.getParameter("name");
	int depart = Integer.parseInt(request.getParameter("depart"));
	int salary = Integer.parseInt(request.getParameter("salary"));
	
	EmplBean eb = new EmplBean();
	eb.setName(name);
	eb.setDepart(depart);
	eb.setSalary(salary); */
	
%>

<jsp:useBean id="eb" class="myPkg.EmplBean"/>
<jsp:setProperty property="name" name="eb"/>
<jsp:setProperty property="depart" name="eb"/>
<jsp:setProperty property="salary" name="eb"/>

<jsp:useBean id="dao" class="myPkg.EmplDao"/>

<%
	String msg;
	String url;
	int cnt = dao.insertData(eb);
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























