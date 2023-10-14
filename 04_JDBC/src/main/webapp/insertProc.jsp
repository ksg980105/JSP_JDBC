<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	long time = System.currentTimeMillis(); // 3229829348202390482
	Timestamp register = new Timestamp(time);
	
	System.out.println(id+"/"+passwd+"/"+name);
	
	String driver = "oracle.jdbc.driver.OracleDriver";	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	try{
		//1
		Class.forName(driver);
		
		//2
		conn = DriverManager.getConnection(url,dbId,dbPw);
		
		//3
		String sql = "insert into member values(?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps.setString(3, name);
		ps.setTimestamp(4,register);
		
		//4.
		int cnt = ps.executeUpdate();
		System.out.println("cnt:" + cnt);
		if(cnt != 0){
			out.println("member 테이블에 레코드 추가했습니다.");
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try {
			if (ps != null) {
				ps.close();
			} 
			if(conn != null){
				conn.close();
			}
		}catch (SQLException e) {
				e.printStackTrace();
		}
	}
%>






