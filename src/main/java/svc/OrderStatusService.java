package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

public class OrderStatusService {

	public ArrayList<OrderBean> orderNonStatusOrderList(String m_id) {
		System.out.println("OrderStatusService - orderNonStatusOrderList()");
		ArrayList<OrderBean> nonOrderArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonOrderArrayList = odao.getOrderNonStatusOrderList(m_id);
		
		close(con);
		
		return nonOrderArrayList;
	}

	public ArrayList<OrderBean> orderStatusOrderList(String m_id) {
		System.out.println("OrderStatusService - orderStatusOrderList()");
		ArrayList<OrderBean> orderArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderArrayList = odao.getOrderStatusOrderList(m_id);
		
		close(con);
		
		return orderArrayList;
	}

	public ArrayList<ItemBean> orderNonStatusItemList(String m_id) {
		System.out.println("OrderStatusService - orderNonStatusItemList()");
		ArrayList<ItemBean> nonItemrArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonItemrArrayList = odao.getOrderNonStatusItemList(m_id);
		
		close(con);
		
		return nonItemrArrayList;
	}

	public ArrayList<ItemBean> orderStatusItemList(String m_id) {
		System.out.println("OrderStatusService - orderStatusItemList()");
		ArrayList<ItemBean> itemrArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		itemrArrayList = odao.getOrderStatusItemList(m_id);
		
		close(con);
		
		return itemrArrayList;
	}

	public ArrayList<OrderDetailBean> orderNonStatusOrderDetailList(String m_id) {
		System.out.println("OrderStatusService - orderNonStatusOrderDetailList()");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		nonOrderDetailArrayList = odao.getOrderNonStatusOrderDetailList(m_id);

		close(con);
		
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> orderStatusOrderDetailList(String m_id) {
		System.out.println("OrderStatusService - orderStatusOrderDetailList()");
		ArrayList<OrderDetailBean> orderDetailArrayList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderDetailArrayList = odao.getOrderStatusOrderDetailList(m_id);

		close(con);
		
		return orderDetailArrayList;
	}

}
