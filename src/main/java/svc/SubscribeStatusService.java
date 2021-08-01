package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class SubscribeStatusService {

	public ArrayList<OrderBean> subscribeNonStatusOrderList(String m_id) {
		System.out.println("SubscribeStatusService - subscribeNonStatusOrderList()");
		ArrayList<OrderBean> nonOrderArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonOrderArrayList = odao.getSubscribeNonStatusOrderList(m_id);
		
		close(con);
		
		return nonOrderArrayList;
	}

	public ArrayList<OrderBean> subscribeStatusOrderList(String m_id) {
		System.out.println("SubscribeStatusService - subscribeStatusOrderList()");
		ArrayList<OrderBean> orderArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderArrayList = odao.getSubscribeStatusOrderList(m_id);
		
		close(con);
		
		return orderArrayList;
	}

	public ArrayList<ItemBean> subscribeNonStatusItemList(String m_id) {
		System.out.println("SubscribeStatusService - subscribeNonStatusItemList()");
		ArrayList<ItemBean> nonItemrArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonItemrArrayList = odao.getSubscribeNonStatusItemList(m_id);
		
		close(con);
		
		return nonItemrArrayList;
	}

	public ArrayList<ItemBean> subscribeStatusItemList(String m_id) {
		System.out.println("SubscribeStatusService subscribeStatusItemList()");
		ArrayList<ItemBean> itemrArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		itemrArrayList = odao.getSubscribeStatusItemList(m_id);
		
		close(con);
		
		return itemrArrayList;
	}

	public ArrayList<OrderDetailBean> subscribeNonStatusOrderDetailList(String m_id) {
		System.out.println("SubscribeStatusService - subscribeNonStatusOrderDetailList");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonOrderDetailArrayList = odao.getSubscribeNonStatusOrderDetailList(m_id);

		close(con);
		
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> subscribeStatusOrderDetailList(String m_id) {
		System.out.println("SubscribeStatusService - subscribeStatusOrderDetailList");
		ArrayList<OrderDetailBean> orderDetailArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderDetailArrayList = odao.getSubscribeStatusOrderDetailList(m_id);

		close(con);
		
		return orderDetailArrayList;
	}

}
