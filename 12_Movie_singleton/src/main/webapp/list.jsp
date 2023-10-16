<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	table{
		margin: auto;
	}
	th{
		background: yellow;
	}
</style>

<script type="text/javascript">
	function insert(){
		location.href='insertForm.jsp';
	}
	
	function allDelete(obj){
		check = obj.checked;
		
		rcheck = document.getElementsByName("rowcheck");
		
		if(check){
			for(var i=0;i<rcheck.length;i++){
				rcheck[i].checked=true;
			}
		}else{
			for(var i=0;i<rcheck.length;i++){
				rcheck[i].checked=false;
			}
		}
	}
	
	function selectDelete(){
		flag = false;
		rcheck = document.getElementsByName("rowcheck");
		for(var i=0;i<rcheck.length;i++){
			if(rcheck[i].checked){
				flag = true;
			}
		}
		if(!flag){
			alert('하나라도 선택하세요');
			return;
		}
		
		document.myform.submit();
	}
</script>
    
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
<%
	MovieDao mdao = MovieDao.getInstance();
	System.out.println("list.jsp mdao:" + mdao);
	ArrayList<MovieBean> lists = mdao.getAllMovie();
%>
<form name="myform" action="deleteAll.jsp">
<input type="button" value="삭제" onClick="selectDelete()">
<input type="button" value="추가" onClick="insert()">
<table border=1>
	<tr>
		<th><input type="checkbox" name="allcheck" onClick="allDelete(this)"></th>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>나이</th>
		<th>좋아하는 장르</th>
		<th>즐겨보는 시간대</th>
		<th>동반관객수</th>
		<th>개선사항</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i=0; i<lists.size(); i++){
			MovieBean mb = lists.get(i);
	%>
	<tr>
		<td><input type="checkbox" name="rowcheck" value="<%= mb.getNum()%>"></td>
		<td><%=mb.getNum() %></td>
		<td><%=mb.getId()%></td>
		<td><%=mb.getName() %></td>
		<td><%=mb.getAge() %></td>
		<td><%=mb.getGenre() %></td>
		<td><%=mb.getTime() %></td>
		<td><%=mb.getPartner()%></td>
		<td><%=mb.getMemo()%></td>
		<td>
			<a href="updateForm.jsp?no=<%=mb.getNum()%>">수정</a>
		</td>
		<td>
			<a href="deleteProc.jsp?no=<%=mb.getNum()%>">삭제</a>
		</td>
	</tr>
	<%}%>
</table>
</form>