<%@page import="myPkg.EmplBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp<br>
<style>
	table{
		text-align: center;
		width: 70%;
		margin: auto;
		border: 2px solid blue;
	}
	th{
		background-color: yellow;
	}
</style>


<jsp:useBean id="edao" class="myPkg.EmplDao"/>
<%
	ArrayList<EmplBean> lists = edao.getAllEmpls();
%>

<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>부서번호</th>
		<th>급여</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		out.print("<tr>");
		for(int i=0; i<lists.size(); i++){
			EmplBean eb = lists.get(i);
	%>
			<tr>
				<td><%=eb.getMid()%></td>
				<td><%=eb.getName()%></td>
				<td><%=eb.getDepart()%></td>
				<td><%=eb.getSalary()%></td>
				<td>
					<a href="updateForm.jsp?mid=<%=eb.getMid()%>">수정</a>
				</td>
				<td>
					<a href="deleteProc.jsp?mid=<%=eb.getMid()%>">삭제</a>
			</tr>
	<%}%>	
</table>

<a href="insertForm.jsp">삽입</a>




































