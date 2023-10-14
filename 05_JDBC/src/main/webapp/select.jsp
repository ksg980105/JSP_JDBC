<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<style>
	table{
		text-align: center;
		width: 500px;
	}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<h2>register 테이블의 레코드를 화면에 표시</h2>
<table border=1>
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>성별</th>
		<th>email</th>
	</tr>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "sqlid";
	String pw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		//1.드라이버 로드
		Class.forName(driver);
			
		//2.계정에 접속
		conn = DriverManager.getConnection(url,user,pw);
			
		//3.sql문 분석
		String sql = "select * from register";
		ps = conn.prepareStatement(sql);
		
		rs = ps.executeQuery();
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			String uname = rs.getString("uname");
			String dname = rs.getString("dname");
		%>
			<tr>
				<td><%=id%></td>
				<td><%=passwd%></td>
				<td><%=name%></td>
				<td><%=gender%></td>
				<td><%=uname%>@<%=dname%></td>
			</tr>
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
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
</table>






































