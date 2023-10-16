<%@page import="myPkg.BookDao"%>
<%@page import="myPkg.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
lists.jsp<br>
<style>
	table{
		text-align: center;
		border: 2px solid blue;
	}
	th{
		background-color: yellow;
	}
</style>

<script type="text/javascript">
	function insert(){
		location.href='insertForm.jsp';
	}

	function allcheck(obj){
		var chkobj = document.getElementsByName("rowcheck");
		
		var check = obj.checked;
		if(check){
			for(var i=0; i<chkobj.length; i++){
				chkobj[i].checked = true;
			}
		}else{
			for(var i=0; i<chkobj.length; i++){
				chkobj[i].checked = false;
			}
		}
	}
	
	function selectDelete(){
		var flag = false;
		var chkobj = document.getElementsByName("rowcheck");
		
		for(var i=0; i<chkobj.length; i++){
			if(chkobj[i].checked){
				flag = true;
			}
		}
		if(!flag){
			alert('삭제할 체크박스 하나라도 선택하세요.');
			return;	//삭제할 체크박스가 없으면 넘어가지 못하도록
		}
		
		document.myForm.submit();
	}
	
</script>

<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>
<%
	/* BookDao bdao = new BookDao(); */
	BookDao bdao = BookDao.getInstance();
	ArrayList<BookBean> lists = bdao.getAllBooks();
%>
<%
	System.out.println("list.jsp bdao:" + bdao);
%>

<form name="myForm" action="deleteAll.jsp">
<input type="button" value="삭제" onClick="selectDelete()">
<input type="button" value="추가" onClick="insert()">

<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" onClick="allcheck(this)"></th>
		<th>번호</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>가격</th>
		<th>입고일</th>
		<th>배송비</th>
		<th>구입 가능 서점</th>
		<th>보유수량</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i=0; i<lists.size(); i++){
			BookBean bb = lists.get(i);
	%>
	<tr>
		<td><input type="checkbox" name="rowcheck" value="<%=bb.getNo()%>"></td>
		<td><%=bb.getNo()%></td>
		<td><%=bb.getTitle()%></td>
		<td><%=bb.getAuthor()%></td>
		<td><%=bb.getPublisher()%></td>
		<td><%=bb.getPrice()%></td>
		<td><%=bb.getDay()%></td>
		<td><%=bb.getKind()%></td>
		<td><%=bb.getBookstore()%></td>
		<td><%=bb.getCount()%></td>
		<td>
			<a href="updateForm.jsp?no=<%=bb.getNo()%>">수정</a>
		</td>
		<td>
			<a href="deleteProc.jsp?no=<%=bb.getNo()%>">삭제</a>
		</td>
	</tr>
	<%} %>
</table>
</form>