package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import vo.CartBean;
import vo.ItemBean;

public class CartDAO {
private static CartDAO instance;
	
	private CartDAO() {}
	
	public static CartDAO getInstance() {
		// 기존 MemberDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if(instance == null) {
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
		
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO cart(c_id,i_id,m_id,c_qty,c_letter,c_rdate,c_delivery_date) VALUES(?,?,?,?,?,now(),now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartBean.getC_id());
			pstmt.setInt(2, cartBean.getI_id());
			pstmt.setString(3, cartBean.getM_id());
			pstmt.setInt(4, 1); // 수량 기본값 1
			pstmt.setInt(5, 1); // 추가상품(편지지) 기본값 1
			pstmt.setDate(6, cartBean.getC_rdate());
			pstmt.setDate(7, cartBean.getC_delivery_date());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		
		
		return insertCount;
	}

	public CartBean getCart(String m_id) {
		System.out.println("CartDAO - getCart()");
		
		CartBean cartDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM cart WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);// 아이디=이메일
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cartDetail = new CartBean();
				cartDetail.setC_id(rs.getInt("c_id"));
				cartDetail.setC_qty(rs.getInt("c_qty"));
				cartDetail.setC_rdate(rs.getDate("c_rdate"));
				cartDetail.setI_id(rs.getInt("i_id"));
				cartDetail.setM_id(rs.getString("m_id"));
				cartDetail.setC_delivery_date(rs.getDate("c_delivery_date"));
				cartDetail.setC_letter(rs.getInt("c_letter"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return cartDetail;
		
	}
	
}
