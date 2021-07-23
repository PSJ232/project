package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import db.JdbcUtil;
import vo.OrderBean;

public class OrderListService {

	public ArrayList<OrderBean> getOrderList(String m_id) {
		System.out.println("OrderListService - getOrderList()");

		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);

		ArrayList<OrderBean> orderList = orderDAO.selectOrderList(m_id);

		JdbcUtil.close(con);

		return orderList;
	}

}
