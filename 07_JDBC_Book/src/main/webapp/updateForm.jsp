<%@page import="myPkg.BookBean"%>
<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp <br>
<jsp:useBean id="bdao" class="myPkg.BookDao"/>
<%
	System.out.println("updateForm.jsp bdao:" + bdao);
%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	out.println("no:" + no);
	BookBean bb = bdao.getBookByNo(no);
	String[] kind={"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
%>

<h1>도서 정보 입력</h1>
	<form name="myform" action="updateProc.jsp" method="post">
		<input type="hidden" name="no" value="<%=no %>">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=bb.getTitle()%>"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="<%=bb.getAuthor()%>"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="<%=bb.getPublisher()%>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=bb.getPrice()%>"></td>
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="day" value="<%=bb.getDay()%>"></td>
			</tr>

			<tr>
				<td>배송비</td>
				<td>
					<%
						for(int i=0; i<=1; i++){
					%>
					<%=kind[i] %> <input type="radio" name="kind" value="유료" <%if(bb.getKind().equals(kind[i])){%>checked<%}%> > 
					<%} %>
			</tr>
			<tr>
				<td>구입가능 서점</td>
				<td>교보문고 <input type="checkbox" name="bookstore" value="교보문고" <% if(bb.getBookstore().contains("교보문고")){%>checked<%}%>>
					알라딘 <input type="checkbox" name="bookstore" value="알라딘" <% if(bb.getBookstore().contains("알라딘")){%>checked<%}%>>
					yes24 <input type="checkbox" name="bookstore" value="예스24" <% if(bb.getBookstore().contains("예스24")){%>checked<%}%>>
					인터파크 <input type="checkbox" name="bookstore" value="인터파크" <% if(bb.getBookstore().contains("인터파크")){%>checked<%}%>>
				</td>
				<%-- <td>
					<%
						for(int i=0; i<bookstore.length; i++){
					%>
					<%=bookstore[i]%><input type="checkbox" name="bookstore" value="<%=bookstore[i]%>" <%if(bb.getBookstore().contains(bookstore[i])){%>checked<%}%>>
				</td> --%>
			</tr>
			<tr>
				<td>보유수량</td>
				<td><select name="count" id="count">
						<option value="선택">선택
				<%
						for(int i=1; i<=5; i++){
				%>
						<option value="<%=i%>" <%if(bb.getCount()==i){%> selected <%}%> ><%=i%></option>		
					<%}%>
				</select></td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="수정하기" > 
		<input type="reset"	value="취소">
	</form>