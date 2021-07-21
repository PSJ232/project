package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.ItemBean;
import vo.OrderBean;
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
		System.out.println("ReviewDAO - getReviewNonStatusOrderBean()");
		
		ArrayList<OrderBean> nonOrderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount "
				+ "FROM orders "
				+ "WHERE o_id IN ("
				+ "SELECT o_id "
				+ "FROM orders_detail "
				+ "WHERE od_review = 0 AND m_id = ?);";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_delivery_date(rs.getString("o_delivery_date"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
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
		System.out.println("ReviewDAO - getReviewStatus()");
		
		ArrayList<OrderBean> orderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount "
				+ "FROM orders "
				+ "WHERE o_id IN ("
				+ "SELECT o_id "
				+ "FROM orders_detail "
				+ "WHERE od_review = 1 AND m_id = ?);";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_delivery_date(rs.getString("o_delivery_date"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
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
		System.out.println("ReviewDAO - getReviewNonStatusItemBean()");
		
		ArrayList<ItemBean> nonItemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.i_id, i.i_name, i.i_img "
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
				ib.setI_img(rs.getString("i_img"));
				nonItemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewNonStatusItemBean() SQL문 오류 - " + e.getMessage());
		}
		return nonItemArrayList;
	}
	
	public ArrayList<ItemBean> getReviewStatusItemList(String m_id) {
		System.out.println("ReviewDAO - getReviewStatusItemBean()");
		
		ArrayList<ItemBean> itemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.i_id, i.i_name, i.i_img "
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
				ib.setI_img(rs.getString("i_img"));
				itemArrayList.add(ib);
			} 
		} catch (Exception e) {
			System.out.println("ReviewDAO - getReviewStatusItemBean() SQL문 오류 - " + e.getMessage());
		}
		return itemArrayList;
	}















}
