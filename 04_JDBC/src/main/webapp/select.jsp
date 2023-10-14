<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<h2>member 테이블 레코드 조회</h2>
<table border="1" width="500">
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>가입일자</th>
	</tr>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		//1.드라이버 로드
		Class.forName(driver);
		
		//2.계정에 접속
		conn = DriverManager.getConnection(url,dbId,dbPw);
		
		//3.sql문 분석
		String sql = "select * from member";
		ps= conn.prepareStatement(sql);
		
		//4.sql문 실행
		rs = ps.executeQuery();
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
			//String reg_date = rs.getString("reg_date");
			String reg_date = String.valueOf(rs.getDate(4));
			
	%>
			<tr align="center">
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=name %></td>
				<td><%=reg_date %></td>
			</tr>	
	<%			
			
		}//while
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		// 5.접속 종료(자원 반납)
		try{
			if(ps != null){
				ps.close();
			}
			if(rs != null){
				rs.close();
			}
			if(conn != null){
				conn.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
%>

</table>


