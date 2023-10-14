<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>

<h2>member 테이블에 레코드 삽입</h2>

<form action="insertProc.jsp">
	아이디 : <input type="text" name="id"><br>
	패스워드 : <input type="text" name="passwd"><br>
	이름 : <input type="text" name="name"><br>
	<input type="submit" value="보내기">
</form>