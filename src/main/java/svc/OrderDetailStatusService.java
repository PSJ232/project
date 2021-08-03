package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;

import static db.JdbcUtil.*;

public class OrderDetailStatusService {

	public OrderBean getMypageOrderDetailOrderBean(String o_id) {
		System.out.println("OrderDetailStatusService - getMypageOrderDetailOrderList()");
		OrderBean orderBean = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderBean = odao.getOrder(o_id);
		
		close(con);
				
		return orderBean;

	}
	
	public ArrayList<OrderDetailBean> getMypageOrderDetailOrderDetailBean(String o_id) {
		System.out.println("OrderDetailStatusService - getMypageOrderDetailOrderList()");
		ArrayList<OrderDetailBean> orderDetailList = null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		orderDetailList = odao.getMypageOrderDetail(o_id);
		
		close(con);
		
		return orderDetailList;
	}
	
	public ArrayList<ItemBean> getMypageOrderDetailItemBean(String o_id) {
		System.out.println("OrderDetailStatusService - getMypageOrderDetailItemBean()");
		ArrayList<ItemBean> itemList= null;
		
		Connection con = getConnection();
		OrderDAO odao = OrderDAO.getInstance();
		odao.setConnection(con);
		
		itemList = odao.getItemList(o_id);
		
		close(con);
		
		return itemList;
		
	}
}
