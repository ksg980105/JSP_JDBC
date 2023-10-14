<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>

<form action="insertProc.jsp" method="post">
아이디 : <input type="text" name="id"><br>
패스워드 : <input type="text" name="passwd"><br>
이름 : <input type="text" name="name"><br>
성별 : 
	<input type="radio" name="gender" value="남">남
	<input type="radio" name="gender" value="여">여<br>
email :
	<input type="text" name="uname">@
	<select name="dname">
		<option value="daum.net">daum.net
		<option value="naver.com">naver.com
		<option value="nate.com">nate.com
		<option value="google.com">google.com
		<option value="yahoo.com">yahoo.com
	</select>
<br><br>
	<input type="submit" value="보내기">
</form>