package svc;

import java.sql.Connection;

import dao.OrderDAO;
import db.JdbcUtil;
import vo.OrderBean;

public class OrderInsertProService {

	public boolean registOrder(OrderBean orderBean) {
		System.out.println("OrderInsertProService - registOrder()");
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

}
