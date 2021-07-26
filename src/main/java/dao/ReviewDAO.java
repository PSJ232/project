package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewDAO {

	private static ReviewDAO instance;
	
	private ReviewDAO() {
	}
	
	public static ReviewDAO getInstance() {
		// 기존 ReviewDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if(instance == null) {
			instance = new ReviewDAO();
		}
		
		return instance;
	}

	// -------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con; // 멤버변수 Connection 타입 선언
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
//	arrayList = rdao.getReviewStatus(m_id);
	public ArrayList<OrderBean> getReviewNonStatusOrderList(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusOrderList()");
		
		ArrayList<OrderBean> nonOrderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o.* "
				+ "FROM orders_detail od JOIN orders o "
				+ "ON od.o_id = o.o_id "
				+ "WHERE od.od_review = 0 AND od.m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				nonOrderArrayList.add(ob);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewNonStatusOrderBean() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return nonOrderArrayList;
	}
	
	public ArrayList<OrderBean> getReviewStatusOrderList(String m_id) {
		System.out.println("ReviewDAO - getReviewStatusOrderList()");
		
		ArrayList<OrderBean> orderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * "
				+ "FROM orders_detail od JOIN orders o "
				+ "ON od.o_id = o.o_id "
				+ "WHERE od.od_review = 1 AND od.m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				orderArrayList.add(ob);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewStatusOrderBean() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return orderArrayList;
	}

	public ArrayList<ItemBean> getReviewNonStatusItemList(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusItemList()");
		
		ArrayList<ItemBean> nonItemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.* "
			+	"FROM orders_detail od JOIN item i "
			+	"ON od.i_id = i.i_id "
			+	"WHERE od.od_review = 0 AND m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				nonItemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewNonStatusItemBean() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return nonItemArrayList;
	}
	
	public ArrayList<ItemBean> getReviewStatusItemList(String m_id) {
		System.out.println("ReviewDAO - getReviewStatusItemList()");
		
		ArrayList<ItemBean> itemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.* "
				+	"FROM orders_detail od JOIN item i "
				+	"ON od.i_id = i.i_id "
				+	"WHERE od.od_review = 1 AND m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				itemArrayList.add(ib);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewStatusItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return itemArrayList;
	}

	public ArrayList<OrderDetailBean> getReviewNonStatusOrderDetailList(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusOrderDetailList");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * "
				+ "FROM orders_detail "
				+ "WHERE od_review = 0 AND m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				nonOrderDetailArrayList.add(odb);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewNonStatusOrderBean() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> getReviewStatusOrderDetailList(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusOrderDetailList");
		ArrayList<OrderDetailBean> orderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * "
				+ "FROM orders_detail "
				+ "WHERE od_review = 1 AND m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				orderDetailArrayList.add(odb);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewNonStatusOrderBean() SQL문 오류 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return orderDetailArrayList;
	}
	
	public int insertReview(ReviewBean rb) {
		System.out.println("ReviewDAO - insertReview()");
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int r_id = 0;
		int od_id = rb.getOd_id();
		try {
			String sql = "SELECT MAX(r_id) FROM review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				r_id = rs.getInt(1) + 1;
			
			sql = "INSERT INTO review VALUES(?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			pstmt.setInt(2, od_id);
			pstmt.setString(3, rb.getR_writer());
			pstmt.setString(4, rb.getR_title());
			pstmt.setString(5, rb.getR_content());
			pstmt.setInt(6, rb.getR_rate());
			pstmt.setString(7, rb.getR_img());
			pstmt.setInt(8, rb.getR_point());
			insertCount = pstmt.executeUpdate();
			
			sql = "UPDATE orders_detail SET od_review=1 WHERE od_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, od_id);
			pstmt.executeUpdate();
					
			// update 테이블 set 수정할열=값,수정할열=값 where 조건열=값;
		} catch (SQLException e) {
			System.out.println("ReviewDAO - insertReview() SQL문 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return insertCount;
	}

	public ReviewBean getReview(int od_id) {
		System.out.println("ReviewDAO - getReview()");
		ReviewBean rb = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM review WHERE od_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, od_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rb = new ReviewBean();
				rb.setR_id(rs.getInt("r_id"));
				rb.setOd_id(rs.getInt("od_id"));
				rb.setR_writer(rs.getString("r_writer"));
				rb.setR_title(rs.getString("r_title"));
				rb.setR_rate(rs.getInt("r_rate"));
				rb.setR_content(rs.getString("r_content"));
				rb.setR_rdate(rs.getDate("r_rdate"));
				rb.setR_img(rs.getString("r_img"));
				rb.setR_point(rs.getInt("r_point"));
				
			} 
		} catch (SQLException e) {
			System.out.println("ReviewDAO - getReview() SQL문 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return rb;
	}

	public int updateReview(ReviewBean rb) {
		System.out.println("ReiewDAO - updateReview()");
		int modifyCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE review SET r_title=?, r_content=?, r_rate=?, r_img=? WHERE r_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rb.getR_title());
			pstmt.setString(2, rb.getR_content());
			pstmt.setInt(3, rb.getR_rate());
			pstmt.setString(4, rb.getR_img());
			pstmt.setInt(5, rb.getR_id());
			modifyCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ReviewDAO - updateReview() SQL구문 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		return modifyCount;
	}

	public int deleteReview(int od_id) {
		System.out.println("ReviewDAO - deleteReview()");
		int dropCount = 0;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM review WHERE od_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, od_id);
			dropCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ReviewDAO - deleteReview() SQL문 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		return dropCount;
	}

	public ArrayList<Integer> getDeleteOdList(String m_id) {
		System.out.println("ReviewDAO - getDeleteOdList()");
		ArrayList<Integer> deleteOdList = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT r.od_id " + "FROM orders_detail od JOIN review r " + "ON od.od_id = r.od_id "
					+ "WHERE od.od_review=1 AND od.m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				deleteOdList.add(rs.getInt("od_id"));
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getDeleteOdList() SQL 구문 오류 : " + e.getMessage());
		}
		return deleteOdList;
	}

	public ArrayList<ReviewBean> getReviewList(int i_id) {
		System.out.println("ReviewDAO - getReviewList()");
		ArrayList<ReviewBean> rbList = new ArrayList<ReviewBean>();
		ReviewBean rb = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT r.* "
				+ "FROM orders_detail od JOIN review r "
				+ "ON od.od_id = r.od_id "
				+ "WHERE od.od_review = 1 AND od.i_id= ? "
				+ "LIMIT 8 ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, i_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rb = new ReviewBean();
				rb.setR_id(rs.getInt("r_id"));
				rb.setOd_id(rs.getInt("od_id"));
				rb.setR_writer(rs.getString("r_writer"));
				rb.setR_title(rs.getString("r_title"));
				rb.setR_rate(rs.getInt("r_rate"));
				rb.setR_content(rs.getString("r_content"));
				rb.setR_rdate(rs.getDate("r_rdate"));
				rb.setR_img(rs.getString("r_img"));
				rb.setR_point(rs.getInt("r_point"));
				rbList.add(rb);
			} 
		} catch (SQLException e) {
			System.out.println("ReviewDAO - getReviewList() SQL문 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return rbList;
	}

}