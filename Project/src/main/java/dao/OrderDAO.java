package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderDAO {

	private static OrderDAO instance;

	private OrderDAO() {
	}

	public static OrderDAO getInstance() {
		if (instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertOrder(OrderBean orderBean) {
		System.out.println("OrderDAO - insertOrder()");

		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO orders VALUES(?,?,?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, orderBean.getO_id());
			pstmt.setString(2, orderBean.getM_id());
			pstmt.setString(3, orderBean.getO_sender());
			pstmt.setString(4, orderBean.getO_address());
			pstmt.setString(5, orderBean.getO_receiver());
			pstmt.setString(6, orderBean.getO_phone());
			pstmt.setString(7, orderBean.getO_delivery_date());
			pstmt.setInt(8, orderBean.getO_amount());
			pstmt.setInt(9, orderBean.getO_point());
			pstmt.setInt(10, orderBean.getO_payment());
			// rdate는 sql구문에 바로 now()
			pstmt.setString(11, "주문접수"); // 배송상태 기본값 주문접수
			pstmt.setInt(12, 0); // 구매확정 기본값 0

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;
	}

	// 각 테이블의 고유ID번호 MAX() 불러오는 메서드 정의
	public int makeId(String table, String colName) {
		System.out.println("OrderDAO - makeId()");
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT MAX(" + colName + ") FROM " + table;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxNum = rs.getInt("MAX(" + colName + ")");
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return maxNum; // 최대번호만 추출하여 리턴하고 IdMakerService에서 id 조합 작업실시
	}

	public int insertOrderDetail(OrderDetailBean orderDetailBean) {
		System.out.println("OrderDAO - insertOrderDetail()");

		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO orders_detail VALUES(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, orderDetailBean.getOd_id());
			pstmt.setInt(2, orderDetailBean.getO_id());
			pstmt.setInt(3, orderDetailBean.getI_id());
			pstmt.setInt(4, orderDetailBean.getL_id());
			pstmt.setInt(5, orderDetailBean.getOd_qty());
			pstmt.setString(6, orderDetailBean.getOd_message());
			pstmt.setInt(7, 0); // 리뷰 기본값 0:(미작성)
			pstmt.setString(8, orderDetailBean.getM_id());

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;

	}

}
