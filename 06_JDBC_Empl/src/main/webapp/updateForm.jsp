<%@page import="myPkg.EmplBean"%>
<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>
<%
	int mid = Integer.parseInt(request.getParameter("mid"));
	out.println("mid:" + mid);
	EmplDao ed = new EmplDao();
	EmplBean eb = ed.getEmplByMid(mid);
	System.out.println(eb.getName());
	System.out.println(eb.getDepart());
	System.out.println(eb.getSalary());
%>

<h2>회원수정</h2><br>

<form action="updateProc.jsp" method="post">
	<input type="hidden" name="mid" value="<%=mid%>">
이름 : <input type="text" name="name" value="<%=eb.getName()%>"><br><br>
부서번호 : 
<select name="depart">
	<!-- <option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option> -->
	<%
		for(int i=1; i<=5; i++){
	%>
		<option value="<%=i%>" <%if(eb.getDepart()==i){%> selected <%}%> ><%=i%></option>		
	<%}%>
</select>
<br><br>
급여 : <input type="text" name="salary" value="<%=eb.getSalary()%>"><br><br>
<input type="submit" value="수정하기">

</form>