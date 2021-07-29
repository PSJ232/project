package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import db.JdbcUtil;
import vo.OrderBean;
import vo.OrderDetailBean;
import vo.DetailBean;

public class OrderService {

	public ArrayList<OrderBean> getOrderList(String m_id) {
		System.out.println("OrderService - getOrderList()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		ArrayList<OrderBean> orderList = orderDAO.selectOrderList(m_id);

		JdbcUtil.close(con);

		return orderList;
	}

	public boolean registOrder(OrderBean orderBean) {
		System.out.println("OrderService - registOrder()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		boolean isOrderSuccess = false;
		int insertCount = orderDAO.insertOrder(orderBean);
		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isOrderSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isOrderSuccess;
	}

	public boolean registOrderDetail(OrderDetailBean orderDetailBean) {
		System.out.println("OrderService - registOrderDetail()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		boolean isOrderdetailSuccess = false;
		int insertCount = orderDAO.insertOrderDetail(orderDetailBean);
		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isOrderdetailSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isOrderdetailSuccess;
	}

	public ArrayList<OrderDetailBean> getOrderDetail(int o_id) {
		System.out.println("OrderService - getOrderDetail()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		orderDetailList = orderDAO.getOrderDetail(o_id);

		JdbcUtil.close(con);

		return orderDetailList;
	}

	public OrderBean getOrder(int o_id) {
		System.out.println("OrderService - getOrder()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		OrderBean orderBean = orderDAO.getOrder(o_id);

		JdbcUtil.close(con);

		return orderBean;
	}

	public boolean modifyOrderConfirm(int o_id, int num) {
		System.out.println("OrderService - modifyOrderConfirm()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		boolean isUpdateSuccess = false;
		int updateCount = orderDAO.updateOrderConfirm(o_id, num);
		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

	public ArrayList<OrderDetailBean> getOrderDetailList(String m_id) {
		System.out.println("OrderService - getOrderDetailList()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		orderDetailList = orderDAO.getOrderDetailList(m_id);

		JdbcUtil.close(con);

		return orderDetailList;
	}
}
