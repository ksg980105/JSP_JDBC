<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp <br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String sid = (String)session.getAttribute("sid");
	
	String passwd = request.getParameter("passwd");
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
		
		String sql = "update register set passwd=?, gender=?, uname=?, dname=? where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, passwd);
		ps.setString(2, gender);
		ps.setString(3, uname);
		ps.setString(4, dname);
		ps.setString(5, id);
		int cnt = ps.executeUpdate();
		if(cnt>0){
	%>
		<script type="text/javascript">
			alert('수정 성공했습니다.');
		</script>
		<meta http-equiv="refresh" content="0; url=select.jsp">
	<%
		}else{
			
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