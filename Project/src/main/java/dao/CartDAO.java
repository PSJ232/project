package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.CartBean;

public class CartDAO {
	private static CartDAO instance;

	private CartDAO() {
	}

	public static CartDAO getInstance() {
		// 기존 MemberDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if (instance == null) {
			instance = new CartDAO();
		}

		return instance;
	}

	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertCart(CartBean cartBean) {
		System.out.println("CartDAO - insertCart()");
		int insertCount = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO cart VALUES(?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartBean.getC_id());
			pstmt.setInt(2, cartBean.getI_id());
			pstmt.setString(3, cartBean.getM_id());
			pstmt.setInt(4, cartBean.getC_qty());
			pstmt.setInt(5, cartBean.getC_letter());
			pstmt.setString(6, cartBean.getC_delivery_date());

			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;
	}

	// 카드에 담긴 상품리스트를 가져오는 메서드
	public ArrayList<CartBean> getCart(String m_id) {
		System.out.println("CartDAO - getCart()");

		ArrayList<CartBean> cartList = null;
		CartBean cartdetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM cart WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			cartList = new ArrayList<CartBean>();

			while (rs.next()) {
				cartdetail = new CartBean();
				cartdetail.setC_id(rs.getInt("c_id"));
				cartdetail.setC_qty(rs.getInt("c_qty"));
				cartdetail.setC_rdate(rs.getDate("c_rdate"));
				cartdetail.setI_id(rs.getInt("i_id"));
				cartdetail.setM_id(rs.getString("m_id"));
				cartdetail.setC_letter(rs.getInt("c_letter"));
				cartdetail.setC_delivery_date(rs.getString("c_delivery_date"));

				cartList.add(cartdetail);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return cartList;

	}

	// 카드에 담긴 상품의 디테일을 가져오는 메서드 (오버로딩)
	public CartBean getCart(int c_id) {
		System.out.println("CartDAO - getCart()");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartBean cartDetail = new CartBean();

		try {
			String sql = "SELECT * FROM cart WHERE c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cartDetail.setC_id(rs.getInt("c_id"));
				cartDetail.setC_qty(rs.getInt("c_qty"));
				cartDetail.setC_rdate(rs.getDate("c_rdate"));
				cartDetail.setI_id(rs.getInt("i_id"));
				cartDetail.setM_id(rs.getString("m_id"));
				cartDetail.setC_letter(rs.getInt("c_letter"));
				cartDetail.setC_delivery_date(rs.getString("c_delivery_date"));

			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return cartDetail;
	}

	public int modifyCart(CartBean cartBean) {

		int updateCount = 0;

		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE cart set c_id=?,c_qty=?,c_rdate=?,i_id=?,c_letter=?,c_delivery_date=? where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartBean.getC_id());
			pstmt.setInt(2, cartBean.getC_qty());
			pstmt.setDate(3, cartBean.getC_rdate());
			pstmt.setInt(4, cartBean.getI_id());
			pstmt.setInt(5, cartBean.getC_letter());
			pstmt.setString(6, cartBean.getC_delivery_date());
			pstmt.setString(7, cartBean.getM_id());

			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return updateCount;
	}

}
