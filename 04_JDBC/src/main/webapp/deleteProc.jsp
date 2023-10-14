<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	
	String driver = "oracle.jdbc.driver.OracleDriver"; 
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbId,dbPw);
		
		String sql = "select id,passwd from member where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		if(rs.next()){
			String mpw = rs.getString("passwd");
			if(mpw.equals(passwd)){
				String sql2 = "delete from member where id=? and passwd=?";
				ps = conn.prepareStatement(sql2);
				ps.setString(1, id);
				ps.setString(2, passwd);
				
				int cnt = ps.executeUpdate();
				if(cnt > 0){
					out.println("삭제 성공했습니다.");
				}
			}else{
				out.println("비번이 일치하지 않습니다.");
			}
		}else{
			out.println("없는 아이디 입니다.");
		}
	}catch(Exception e){
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






