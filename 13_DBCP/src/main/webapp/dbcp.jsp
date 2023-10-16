<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement ps = null;
	
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
	conn = ds.getConnection();
	System.out.println("conn:"+conn);
	
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	
	if(username != null){
		String sql = "insert into tdbcp values(?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1,username);
		ps.setString(2,email);
	}
	
	ps.executeUpdate();
%>


<form name="myform" method="post" action="dbcp.jsp">
	이름 : <input type="text" name="username"><br>
	이메일 : <input type="text" name="email"><br><br>
	
	<input type="submit" value="등록">
</form>
<hr>

목록보기 <br>
<%
	String sql = "select * from tdbcp";
	ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	int i=0;
	while(rs.next()){
		out.print(i+":"+rs.getString("username") + "," + rs.getString("email")+"<br>");
		i++;
	}
	
	rs.close();
	ps.close();
	conn.close();
%>
