<%@page import="myPkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp(번호) 
updateProc.jsp(번호)
=> updateForm.jsp<br>

<%
	int num = Integer.parseInt(request.getParameter("no"));
	System.out.println(num);
%>
<jsp:useBean id="dao" class="myPkg.StudentDao"/>
<%
	StudentBean sb = dao.getStudentByNum(num); 
%>

<h2>회원수정 updateForm.jsp</h2>
	<form action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%= num %>">
		아이디 : <%=sb.getId() %><br><br>  
		비밀번호 :
		<input type="password" name="passwd" value="<%=sb.getPasswd()%>"><br><br>  
		이름	: <input type="text" name="name" value="<%=sb.getName() %>"><br><br>   
		생년월일 :
		<select name="year">
				<%for(int i = 2023; i >= 1930; i--){%>
					<option value="<%=i%>" <%if(sb.getYear() == i){%>selected<%}%>><%=i%>
				<%}%>
		</select> 년
		
		<select name="month">
			<%
				for(int i=1;i<=12;i++){
					%>
					<option value="<%=i %>" <%if(i == sb.getMonth()){ %> selected <% } %> ><%=i %></option>					
				<%}%> 
		</select> 월
		
		<select name="day">
			<%
				for(int i=1;i<=31;i++){
					%>
					<option value="<%=i %>" <%if(i == sb.getDay()){ %> selected <% } %>><%=i %></option>					
				<%}%> 
		</select> 일
		 <br>
		<br> 취미 : 
		<!-- <input type="checkbox" name="hobby" value="달리기">달리기
		<input type="checkbox" name="hobby" value="수영">수영 
		<input type="checkbox" name="hobby" value="게임">게임 
		<input type="checkbox" name="hobby" value="영화">영화 -->
		<% 
			String[] hobby = {"달리기","수영","게임","영화"};
			for(int i=0;i<hobby.length;i++){ %>
				<input type="checkbox" name="hobby" value="<%=hobby[i] %>"  <%if(sb.getHobby().contains(hobby[i])){ %>checked<%} %> ><%=hobby[i] %>
			<%}%>
		<br> <br><br> 

		[점수입력]<br> 
		C언어 : 	<input type="text" name="c" size="10" value="<%=sb.getC()%>">
		JAVA : <input type="text" name="java" size="10" value="<%=sb.getJava()%>">
		JSP : <input type="text" name="jsp" size="10" value="<%=sb.getJsp()%>"><br><br> 
		 
		<input type="submit" value="수정하기">
	</form>