<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		width: 600px;
		margin: auto;
	}
</style>

<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var isBlank = false;
		var use ="";
		
		$('#id_check').click(function(){
			isCheck = true;
			if($('input[name="id"]').val()==""){
				alert("아이디를 입력하세요");
				isBlank = true;
				return;
			}	
			isBlank = false;
			
			$.ajax({
					url : "id_check_proc.jsp",
					data : ({
						userid : $('input[name="id"]').val()
					}),
					success : function(data){
						//alert("data:"+data);
						if($.trim(data)=='YES'){
							$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
							$('#idmessage').show();
							use = "possible";
						}else{
							$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
							$('#idmessage').show();
							use = "impossible";
						}
					}
			});
		});
		
		$("input[name='join']").click(function(){
			if($('input[name="id"]').val()==""){
				alert('내용을 입력하세요.');
				return;
			}
		});
		
		$("input[name='id']").keydown(function(){
			isCheck = false;
			use="";
			$('#idmessage').css('display','none');
		});
		
		$('#sub').click(function(){
			if(use == "impossible"){
				alert("이미 사용중인 아이디입니다.");
				return false;
			}else if(isCheck == false){
				alert("중복 체크를 하세요.");
				return false;
			}else if(isBlack == true){
				alert("아이디를 입력하세요");
				return false;
			}
		});
	});
</script> 

<h2>영화 선호도 조사</h2>

<form action="insertProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id">
				<button type="button" id="id_check">중복체크</button>
				<span id="idmessage" style="display: none">sdfsdf</span>
			</td>
			
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td>
				<%
					String[] genre = {"공포","다큐","액션","애니메이션"};
					for(int i=0; i<genre.length; i++){
				%>
					<input type="checkbox" name="genre" value="<%=genre[i]%>"><%=genre[i]%>
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
						<option value="<%=time[i]%>"><%=time[i]%></option>
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
				<input type="radio" name="partner" value=<%=i%>><%=i%>
			<%} %>
			</td>
		</tr>
		<tr>
			<td>영화관 개선사항</td>
			<td>
				<textarea rows="4" cols="40" name="memo" >value는 여기에 넣기</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="가입하기" name="join">
			</td>
		</tr>
	</table>
</form>