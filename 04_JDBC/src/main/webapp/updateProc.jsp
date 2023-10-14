<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>
<%
    request.setCharacterEncoding("UTF-8");
    
    String id = request.getParameter("id"); // kim
    String passwd = request.getParameter("passwd"); // 1234
    String name = request.getParameter("name");
    System.out.println(id+"/"+passwd+"/"+name);
    
    String driver = "oracle.jdbc.driver.OracleDriver";	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		//1
		Class.forName(driver);
		
		//2
		conn = DriverManager.getConnection(url,dbId,dbPw);

		// 수정폼에서 입력한 kim, 1234
		String sql = "select id,passwd from member where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		rs = ps.executeQuery();
		//kim   1234
		if(rs.next()){
			String mPw= rs.getString("passwd");
			if(mPw.equals(passwd)){
				// 수정
				//3.
				String sql2 ="update member set name=? where id=? and passwd=?";
				ps = conn.prepareStatement(sql2);
				ps.setString(1, name);
				ps.setString(2, id);
				ps.setString(3, passwd);
				
				//4
				int cnt = ps.executeUpdate();
				if(cnt>0){
					out.println("member 테이블의 레코드 수정했습니다.");
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
			if(conn != null){
				conn.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
    %>

    
    
    
    
    
    
    
    
    
    