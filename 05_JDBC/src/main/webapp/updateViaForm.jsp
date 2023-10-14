<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateViaForm.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "sqlid";
	String pw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url,user,pw);
		
		String sql = "select * from register where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		if(rs.next()){
			// 아이디가 있다.
			String rpw = rs.getString("passwd");
			if(rpw.equals(passwd)){
				//비번이 같다.
				/* session.setAttribute("sid", id); */
	%>
			<form method="post" action="updateProc.jsp">
				<input type="hidden" name="id" value="<%=id%>">
				<table border="1">
				<tr>
					<th colspan="2">수정할 정보를 입력해주세요.</th>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=id%></td>
					<%-- <td><input type="text" name="id" value="<%=id%>" readonly></td> --%>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="passwd"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=rs.getString("name")%></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="uname" value="<%=rs.getString("uname")%>">@
						<select name="dname">
							<option value="daum.net">daum.net
							<option value="naver.com">naver.com
							<option value="nate.com">nate.com
							<option value="google.com">google.com
							<option value="yahoo.com">yahoo.com
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>	
			</form>
	<%					
			}else{
				//비번이 같지 않다.
	%>
			<script type="text/javascript">
				alert("비번이 다릅니다.\n비번을 다시 확인하세요");
			</script>
			<meta http-equiv="refresh" content="0; url=updateForm.jsp">
	<%			
			}
		}else{
			// 아이디가 없다.
	%>
		<script type="text/javascript">
			alert("없는 아이디입니다.\n아이디를 다시 확인하세요");
		</script>
		<meta http-equiv="refresh" content="0; url=updateForm.jsp">
	<%
		}
		
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try {
			if (ps != null) {
				ps.close();
			} 
			if (rs != null) {
				rs.close();
			}
			if (conn != null){
				conn.close();
			}
		}catch (Exception e) {
				e.printStackTrace();
		}
	}
%>


















