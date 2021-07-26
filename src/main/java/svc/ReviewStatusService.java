package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

import static db.JdbcUtil.*;


public class ReviewStatusService {

	public ArrayList<OrderBean> reviewNonStatusOrderList(String m_id) {
		System.out.println("ReviewStatusService - reviewNonStatusOrderList()");
		ArrayList<OrderBean> nonOrderArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		nonOrderArrayList = rdao.getReviewNonStatusOrderList(m_id);
		
		close(con);
		
		return nonOrderArrayList;
	}
	
	public ArrayList<OrderBean> reviewStatusOrderList(String m_id) {
		System.out.println("ReviewStatusService - reviewStatusOrderList()");
		ArrayList<OrderBean> orderArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		orderArrayList = rdao.getReviewStatusOrderList(m_id);
				
		close(con);
		
		return orderArrayList;
	}
	
	public ArrayList<ItemBean> reviewNonStatusItemList(String m_id) {
		System.out.println("ReviewStatusService - reviewNonStatusItemList()");
		ArrayList<ItemBean> nonItemArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		nonItemArrayList = rdao.getReviewNonStatusItemList(m_id);
		
		close(con);
		
		return nonItemArrayList;
	}
	
	public ArrayList<ItemBean> reviewStatusItemList(String m_id) {
		System.out.println("ReviewStatusService - reviewStatusItemList()");
		ArrayList<ItemBean> itemArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		itemArrayList = rdao.getReviewStatusItemList(m_id);
		
		close(con);
		
		return itemArrayList;
	}

	public ArrayList<Integer> reviewDeleteOdList(String m_id) {
		System.out.println("ReviewStatusService - reviewDeleteOdList()");
		ArrayList<Integer> deleteOdList = null;
	
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		deleteOdList = rdao.getDeleteOdList(m_id);
		
		close(con);
		
		return deleteOdList;
	}

	public ArrayList<OrderDetailBean> reviewNonStatusOrderDetailList(String m_id) {
		System.out.println("ReviewStatusService - reviewNonStatusOrderDetailList()");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		nonOrderDetailArrayList = rdao.getReviewNonStatusOrderDetailList(m_id);
		
		close(con);
		
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> reviewStatusOrderDetailList(String m_id) {
		System.out.println("ReviewStatusService - reviewStatusOrderDetailList()");
		ArrayList<OrderDetailBean> orderDetailArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		orderDetailArrayList = rdao.getReviewStatusOrderDetailList(m_id);
		
		close(con);
		
		return orderDetailArrayList;
	}

}
