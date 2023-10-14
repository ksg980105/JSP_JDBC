package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="sqlid";
	String dbpw="sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public StudentDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<StudentBean> getAllStudents() {
		ArrayList<StudentBean> list = new ArrayList<StudentBean>();
		String sql = "select * from student order by num asc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = Integer.parseInt(rs.getString("num"));
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				int year = Integer.parseInt(rs.getString("year"));
				int month = Integer.parseInt(rs.getString("month"));
				int day = Integer.parseInt(rs.getString("day"));
				String hobby = rs.getString("hobby");
				int c = Integer.parseInt(rs.getString("c"));
				int java = Integer.parseInt(rs.getString("java"));
				int jsp = Integer.parseInt(rs.getString("jsp"));
				int sum = Integer.parseInt(rs.getString("sum"));
				
				StudentBean sb = new StudentBean();
				sb.setNum(num);
				sb.setId(id);
				sb.setPasswd(passwd);
				sb.setName(name);
				sb.setYear(year);
				sb.setMonth(month);
				sb.setDay(day);
				sb.setHobby(hobby);
				sb.setC(c);
				sb.setJava(java);
				sb.setJsp(jsp);
				sb.setSum(sum);
				
				list.add(sb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("list.size():" + list.size());
		return list;
	}
	
	public int insertData(StudentBean sb) {
		int cnt = -1;
		String sql="insert into student values(stu_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getId());
			ps.setString(2, sb.getPasswd());
			ps.setString(3, sb.getName());
			ps.setInt(4, sb.getYear());
			ps.setInt(5, sb.getMonth());
			ps.setInt(6, sb.getDay());
			ps.setString(7, sb.getHobby());
			ps.setInt(8, sb.getC());
			ps.setInt(9, sb.getJava());
			ps.setInt(10, sb.getJsp());
			ps.setInt(11, sb.getSum());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public StudentBean getStudentByNum(int num) {
		StudentBean sb = new StudentBean();
		String sql = "select * from student where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				sb.setId(rs.getString("id"));
				sb.setPasswd(rs.getString("passwd"));
				sb.setName(rs.getString("name"));
				sb.setYear(rs.getInt("year"));
				sb.setMonth(rs.getInt("month"));
				sb.setDay(rs.getInt("day"));
				sb.setHobby(rs.getString("hobby"));
				sb.setC(rs.getInt("c"));
				sb.setJava(rs.getInt("java"));
				sb.setJsp(rs.getInt("jsp"));
				sb.setSum(rs.getInt("sum"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return sb;
	}
	
	public int updateData(StudentBean sb) {
		int cnt = -1;
		String sql = "update student set passwd=?,name=?,year=?,month=?,day=?,hobby=?,c=?,java=?,jsp=?,sum=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getPasswd());
			ps.setString(2, sb.getName());
			ps.setInt(3, sb.getYear());
			ps.setInt(4, sb.getMonth());
			ps.setInt(5, sb.getDay());
			ps.setString(6, sb.getHobby());
			ps.setInt(7, sb.getC());
			ps.setInt(8, sb.getJava());
			ps.setInt(9, sb.getJsp());
			ps.setInt(10,sb.getSum());
			ps.setInt(11, sb.getNum());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteData(int num) {
		int cnt = -1;
		String sql = "delete from student where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteCheckData(String[] rowcheck) {
		PreparedStatement ps = null;
		int cnt = -1;
		
		String sql = "delete from book where no=?";
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int i=0; i<rowcheck.length; i++) {
				ps.setInt(1, Integer.parseInt(rowcheck[i]));
				cnt = ps.executeUpdate();
				conn.commit();
			}
						
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
	
	public boolean searchId(String id) {
		String sql = "select * from student where id=?";
		boolean check = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				check=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return check;
	}
}






















































