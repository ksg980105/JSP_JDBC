<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int num = Integer.parseInt(request.getParameter("no"));
%>
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
<%
	MovieDao mdao = MovieDao.getInstance();
	System.out.println("updateForm.jsp mdao:" + mdao);
	MovieBean mb = mdao.getMovieByNum(num);
%>


<h2>수정 updateForm.jsp</h2>

<form action="updateProc.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>"><br>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=mb.getId()%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="<%=mb.getAge()%>"></td>
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td>
				<%
					String[] genre = {"공포","다큐","액션","애니메이션"};
					for(int i=0; i<genre.length; i++){
				%>
					<input type="checkbox" name="genre" value="<%=genre[i]%>" <%if(mb.getGenre().contains(genre[i])){%>checked<%}%>><%=genre[i]%>
				<%} %>
			</td>
		</tr>
		<tr>
			<td>즐겨보는 시간대</td>
			<td>
				<select name="time">
				<%
					String[] time = {"08~10","10~12","12~14","14~16","16~18","18~20"};
					for(int i=0; i<time.length; i++){						
				%>
						<option value="<%=time[i]%>" <%if(mb.getTime().equals(time[i])){%>selected<%}%>><%=time[i]%></option>
				<% }%>
				</select>
			</td>
		</tr>
		<tr>
			<td>동반 관객수</td>
			<td>
				<%
					for(int i=1; i<=5; i++){
				%>
				<input type="radio" name="partner" value="<%=i%>" <%if(i==mb.getPartner()){%>checked<%}%>><%=i%>
			<%} %>
			</td>
		</tr>
		<tr>
			<td>영화관 개선사항</td>
			<td>
				<textarea rows="4" cols="40" name="memo" ><%=mb.getMemo()%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기">
			</td>
		</tr>
	</table>
</form>