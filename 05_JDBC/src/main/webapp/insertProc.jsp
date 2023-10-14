<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "sqlid";
	String pw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	try{
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url,user,pw);
		
		String sql = "insert into register values(?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps.setString(3, name);
		ps.setString(4, gender);
		ps.setString(5, uname);
		ps.setString(6, dname);
		
		int cnt = ps.executeUpdate();
		
		if(cnt != 0){
			out.print("register 테이블에 레코드 추가 완료");
		}
		
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try {
			if (ps != null) {
				ps.close();
			} 
			if(conn != null){
				conn.close();
			}
		}catch (Exception e) {
				e.printStackTrace();
		}
	}
%>

<meta http-equiv="refresh" content="2; url=select.jsp">


























