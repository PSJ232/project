package svc;

import java.sql.Connection;

import dao.OrderDAO;
import db.JdbcUtil;
import vo.OrderDetailBean;

public class OrderDetailProService {
	
	public boolean registOrderDetail(OrderDetailBean orderDetailBean) {
		System.out.println("OrderDetailProService");
		
		boolean isOrderdetailSuccess = false;
		Connection con = JdbcUtil.getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		
		
		
		return isOrderdetailSuccess;
	}

}
