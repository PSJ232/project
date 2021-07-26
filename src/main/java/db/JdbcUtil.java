package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {

	public static Connection getConnection() {
		Connection con = null;

		try {
			// DBCP 를 통해 생성된 Connection 객체 가져오기
			Context initCtx = new InitialContext();
			// 2) <Context> 태그 내의 <Resource> 태그 부분 가져오기 위해
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			// 3) <Resource> 태그 내의 name 속성 가져오기 위해
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQL");
			// 4. 리턴받은 DataSource 객체(커넥션풀)로부터 Connection 객체 가져오기
			con = ds.getConnection();
			// 5. 트랜잭션을 적용하기 위해 데이터베이스(MySQL) 의 Auto Commit 기능 해제
			con.setAutoCommit(false);

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con;
	}

	public static void close(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
