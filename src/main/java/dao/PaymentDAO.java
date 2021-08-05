package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import static db.JdbcUtil.*;

public class PaymentDAO {
	private static PaymentDAO instance;

	private PaymentDAO() {
	}

	public static PaymentDAO getInstance() {
		// 기존 MemberDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if (instance == null) {
			instance = new PaymentDAO();
		}

		return instance;
	}

	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언

	public void setConnection(Connection con) {
		this.con = con;
	}

	public HashMap<String, Integer> getSalesInfo() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String, Integer> salesInfo = new HashMap<String, Integer>();
		try {
			String sql = "SELECT SUM(o_amount) FROM orders WHERE o_payment=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("카드매출", rs.getInt(1));
			}
			close(rs);
			close(pstmt);
			sql = "SELECT SUM(o_amount) FROM orders WHERE o_payment=0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("현금매출", rs.getInt(1));
			}
			close(rs);
			close(pstmt);
			sql = "SELECT SUM(o_amount) FROM orders";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("총매출", rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return salesInfo;
	}
	

	public HashMap<String, Integer> getWeekCardSales() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String,Integer> weekCardSales = new HashMap<String, Integer>();
		try {
			String sql = "SELECT DATE_FORMAT(o_rdate,'%m%d'), SUM(o_amount) "
					+ "FROM orders "
					+ "WHERE o_payment=1 "
					+ "GROUP BY DATE_FORMAT(o_rdate,'%m%d') "
					+ "ORDER BY o_rdate DESC LIMIT 7";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				weekCardSales.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return weekCardSales;
	}
	public HashMap<String, Integer> getWeekCashSales() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String,Integer> weekCardSales = new HashMap<String, Integer>();
		try {
			String sql = "SELECT DATE_FORMAT(o_rdate,'%m%d'), SUM(o_amount) "
					+ "FROM orders "
					+ "WHERE o_payment=0 "
					+ "GROUP BY DATE_FORMAT(o_rdate,'%m%d') "
					+ "ORDER BY o_rdate DESC LIMIT 7";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				weekCardSales.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return weekCardSales;
	}
}
