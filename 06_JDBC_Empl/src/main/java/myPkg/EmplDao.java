package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmplDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "sqlid";
	String pw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public EmplDao() {
		System.out.println("EmplDao() 생성자");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pw);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmplBean> getAllEmpls(){
		ArrayList<EmplBean> lists = new ArrayList<EmplBean>();
		String sql = "select * from empl order by mid asc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int mid = rs.getInt("mid");
				String name = rs.getString("name");
				int depart = rs.getInt("depart");
				int salary = rs.getInt("salary");
				
				EmplBean eb = new EmplBean();
				eb.setMid(mid);
				eb.setName(name);
				eb.setDepart(depart);
				eb.setSalary(salary);
				
				lists.add(eb);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (ps != null) {
					ps.close();
				} 
				if (rs != null) {
					rs.close();
				}
				if(conn != null){
					conn.close();
				}
			}catch (SQLException e) {
					e.printStackTrace();
			}
		}
		System.out.println(lists.size());
		return lists;
	}
	
	public int insertData(EmplBean eb) {
		String sql2 = "insert into empl values(e_seq.nextval,?,?,?)";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql2);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDepart());
			ps.setInt(3, eb.getSalary());
			
			cnt = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}try {
			if (ps != null) {
				ps.close();
			} 
			if(conn != null){
				conn.close();
			}
		}catch (Exception e) {
				e.printStackTrace();
		}
		System.out.println("insertData cnt:" + cnt);
		return cnt;
	}
	
	public EmplBean getEmplByMid(int mid) {
		EmplBean eb = new EmplBean();
		
		String sql = "select * from empl where mid=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mid);
			rs = ps.executeQuery();
			if(rs.next()) {
				eb.setName(rs.getString("name"));
				eb.setDepart(rs.getInt("depart"));
				eb.setSalary(rs.getInt("salary"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (ps != null) {
					ps.close();
				} 
				if (rs != null) {
					rs.close();
				}
				if(conn != null){
					conn.close();
				}
			}catch (SQLException e) {
					e.printStackTrace();
			}
		}
		
		return eb;
		
	}
	
	public int updateData(EmplBean eb) {
		int cnt=-1;
		String sql = "update empl set name=?, depart=?, salary=? where mid=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDepart());
			ps.setInt(3, eb.getSalary());
			ps.setInt(4, eb.getMid());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
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
		
		return cnt;
	}
	
	public int deleteData(int mid) {
		int cnt=-1;
		String sql = "delete from empl where mid=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mid);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
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
		
		return cnt;
	}
	
}































