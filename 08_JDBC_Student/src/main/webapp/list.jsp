<%@page import="myPkg.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp<br>
<style>
	table{
		margin: auto;
		width: 90%;
		text-align: center;
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
		alert(1);
		check = obj.checked;
		alert(check);
		
		//rcheck = document.myform.rowcheck;
		rcheck = document.getElementsByName("rowcheck");
		alert('rcheck.length:' + rcheck.length);
		
		if(check){ // 
			for(var i=0;i<rcheck.length;i++){
				rcheck[i].checked=true;
			}
		}else{
			for(var i=0;i<rcheck.length;i++){
				rcheck[i].checked=false;
			}
		}
	}//allDelete
	
	function selectDelete(){
		alert(2);
		flag = false;
		//rcheck = document.myform.rowcheck;
		rcheck = document.getElementsByName("rowcheck");
		for(var i=0;i<rcheck.length;i++){
			if(rcheck[i].checked){
				flag = true;
			}
		}
		if(!flag){
			alert('하나라도 선택하세요');
			return; // 
		}
		
		document.myform.submit(); // 
	}
</script>
<jsp:useBean id="sdao" class="myPkg.StudentDao" />
<% 
	ArrayList<StudentBean> lists = sdao.getAllStudents(); 
%>
<form name="myform" action="deleteAll.jsp">
	<table border=1>
		<tr>
			<th><input type="checkbox" name="allcheck" onClick="allDelete(this)"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>취미</th>
			<th>C언어</th>
			<th>Java</th>
			<th>Jsp</th>
			<th>합계</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
			<% 
				for(int i=0;i<lists.size();i++){
					StudentBean sb = lists.get(i);
				
					String day = sb.getYear() + "-" + sb.getMonth() + "-" + sb.getDay();
			
			%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%= sb.getNum() %>"></td>
			<td><%= sb.getNum() %></td>
			<td><%= sb.getId() %></td>
			<td><%= sb.getPasswd() %></td>
			<td><%= sb.getName() %></td>
			<td><%= day %></td>
			<%-- <td><%= sb.getYear() %> - <%= sb.getMonth() %> - <%= sb.getDay() %></td> --%>
			<td><%= sb.getHobby() %></td>
			<td><%= sb.getC() %></td>
			<td><%= sb.getJava() %></td>
			<td><%= sb.getJsp() %></td>
			<td><%= sb.getSum() %></td>
			<td><a href="updateForm.jsp?no=<%=sb.getNum()%>">수정</a></td>
			<td><a href="deleteProc.jsp?num=<%=sb.getNum()%>">삭제</a></td>
		</tr>
		<% } %>
	</table>
	
	<input type="button" value="삽입" onClick="insert()">
	<input type="button" value="삭제" onClick="selectDelete()">	
</form>





