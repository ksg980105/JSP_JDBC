<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp <br>
<h1>도서 정보 입력</h1>
	<form name="myform" action="insertProc.jsp" method="post">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author">
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher">
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price">
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="day">
			</tr>

			<tr>
				<td>배송비</td>
				<td>유료 <input type="radio" name="kind" value="유료"> 
					무료 <input type="radio" name="kind" value="무료">
			</tr>
			<tr>
				<td>구입가능 서점</td>
				<td>교보문고 <input type="checkbox" name="bookstore" value="교보문고">
					알라딘 <input type="checkbox" name="bookstore" value="알라딘">
					yes24 <input type="checkbox" name="bookstore" value="예스24">
					인터파크 <input type="checkbox" name="bookstore" value="인터파크">
			</tr>
			<tr>
				<td>보유수량</td>
				<td><select name="count" id="count">
						<option value="선택">선택
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
				</select></td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="전송" > 
		<input type="reset"	value="취소">
	</form>