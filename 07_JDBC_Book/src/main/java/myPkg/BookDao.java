package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="sqlid";
	String dbpw="sqlpw";
	Connection conn = null;
	
	public BookDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//BookDao
	
	public ArrayList<BookBean> getAllBooks(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<BookBean> lists = new ArrayList<BookBean>();
		String sql = "select * from book order by no asc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = Integer.parseInt(rs.getString("no"));
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = Integer.parseInt(rs.getString("price"));
				//String day = rs.getString("day");
				String day = String.valueOf(rs.getDate("day"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = Integer.parseInt(rs.getString("count"));
				
				BookBean bb = new BookBean();
				bb.setNo(no);
				bb.setTitle(title);
				bb.setAuthor(author);
				bb.setPublisher(publisher);
				bb.setPrice(price);
				bb.setDay(day);
				bb.setKind(kind);
				bb.setBookstore(bookstore);
				bb.setCount(count);
				
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		System.out.println("lists.size():" + lists.size());
		return lists;
	}// getAllBooks
	
	public int insertData(BookBean bb) {
		System.out.println(bb.getTitle());
		System.out.println(bb.getKind());
		System.out.println(bb.getBookstore());
		
		PreparedStatement ps = null;
		int cnt =-1;
		String sql="insert into book values(bseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			//conn.setAutoCommit(true);
			ps= conn.prepareStatement(sql);
			
			ps.setString(1,bb.getTitle());
			ps.setString(2,bb.getAuthor());
			ps.setString(3,bb.getPublisher());
			ps.setInt(4,bb.getPrice());
			ps.setString(5,bb.getDay());
			ps.setString(6,bb.getKind());
			ps.setString(7,bb.getBookstore());
			ps.setInt(8,bb.getCount());
			
			cnt= ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			try {
				if (ps != null) {
					ps.close();
				} 
				if (conn != null){
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.print("insertData cnt: "+cnt);
		return cnt;
	}
	
	public BookBean getBookByNo(int no) {
		BookBean bb = new BookBean();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from book where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setPrice(rs.getInt("price"));
				bb.setDay(rs.getString("day"));
				bb.setKind(rs.getString("kind"));
				bb.setBookstore(rs.getString("bookstore"));
				bb.setCount(rs.getInt("count"));
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
		return bb;
	}
	
	public int updateData(BookBean bb) {
		PreparedStatement ps = null;
		int cnt = -1;
		
		String sql = "update book set title=?, author=?, publisher=?, price=?, day=?, kind=?, bookstore=?,count=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setString(3, bb.getPublisher());
			ps.setInt(4, bb.getPrice());
			ps.setString(5, bb.getDay());
			ps.setString(6, bb.getKind());
			ps.setString(7, bb.getBookstore());
			ps.setInt(8, bb.getCount());
			ps.setInt(9, bb.getNo());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if (ps != null) {
					ps.close();
				} 
				if (conn != null){
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteData(int no) {
		PreparedStatement ps = null;
		String sql = "delete from book where no=?";
		int cnt=-1;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
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
	
	public int deleteCheckData(String[] rowcheck) {
		PreparedStatement ps = null;
		int cnt = -1;
		
		String sql = "delete from book where no=?";
		/*
		 * for(int i=0; i<rowcheck.length-1; i++) { sql += " or no=?"; }
		 */
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			/*for(int i=1; i<=rowcheck.length; i++) {
				ps.setInt(i, Integer.parseInt(rowcheck[i-1]));
			}*/
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
}






