<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="post" action="result.jsp" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br><br>
	파일 : <input type="file" name="filename"><br><br>
	
	<input type="submit" value="업로드">
</form>

<!-- 
파일 업로드
cos.jar
method="post" 방식으로 해야함(파일업로드)
enctype
-->