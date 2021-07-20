package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.ItemBean;
import vo.OrderBean;

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
	public ArrayList<OrderBean> getReviewNonStatusOrderBean(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusOrderBean()");
		
		ArrayList<OrderBean> nonOrderArrayList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount "
				+ "FROM orders "
				+ "WHERE o_id IN ("
				+ "SELECT o_id "
				+ "FROM orders_detail "
				+ "WHERE od_review = 0 AND m_id = '1@1');";
		
		return nonOrderArrayList;
	}
	
	public ArrayList<OrderBean> getReviewStatusOrderBean(String m_id) {
		System.out.println("ReviewDAO - getReviewStatus()");
		
		ArrayList<OrderBean> nonOrderarrayList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount "
				+ "FROM orders "
				+ "WHERE o_id IN ("
				+ "SELECT o_id "
				+ "FROM orders_detail "
				+ "WHERE od_review = 1 AND m_id = '1@1');";
		
		return nonOrderarrayList;
	}
	
	public ArrayList<ItemBean> getReviewStatusItemBean(String m_id) {
		System.out.println("ReviewDAO - getReviewStatusItemBean()");
		
		ArrayList<ItemBean> itemArrayList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i_id, i_name, i_img" 
					+"FROM item" 
					+"WHERE i_id IN ( " 
					+"		SELECT i_id"
					+"		FROM orders_detail"
					+"		WHERE od_review = 0 AND m_id = '1@1'"
					+"  );";
		
		return itemArrayList;
	}

	public ArrayList<ItemBean> getReviewNonStatusItemBean(String m_id) {
		System.out.println("ReviewDAO - getReviewNonStatusItemBean()");
		
		ArrayList<ItemBean> nonItemArrayList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount "
				+ "FROM orders "
				+ "WHERE o_id IN ("
				+ "SELECT o_id "
				+ "FROM orders_detail "
				+ "WHERE od_review = 0 AND m_id = '1@1');";
		
		return nonItemArrayList;
	}















}
