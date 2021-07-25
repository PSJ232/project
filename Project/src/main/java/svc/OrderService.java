package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import db.JdbcUtil;
import vo.OrderBean;
import vo.OrderDetailBean;

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
		boolean isOrderSuccess = false;

		Connection con = JdbcUtil.getConnection();

		OrderDAO orderDAO = OrderDAO.getInstance();

		orderDAO.setConnection(con);

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

		boolean isOrderdetailSuccess = false;
		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

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

}
