package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.HashMap;

import dao.PaymentDAO;

public class PaymentService {

	public HashMap<String, Integer> getSalesInfo() {
		Connection con = getConnection();
		PaymentDAO paymentDAO = PaymentDAO.getInstance();
		paymentDAO.setConnection(con);
		HashMap<String, Integer> salesInfo = paymentDAO.getSalesInfo();
		close(con);
		return salesInfo;
	}

	public HashMap<String, Integer> getWeekCardSales() {
		Connection con = getConnection();
		PaymentDAO paymentDAO = PaymentDAO.getInstance();
		paymentDAO.setConnection(con);
		HashMap<String, Integer> weekCardSales = paymentDAO.getWeekCardSales();
		close(con);
		return weekCardSales;
	}
	public HashMap<String, Integer> getWeekCashSales() {
		Connection con = getConnection();
		PaymentDAO paymentDAO = PaymentDAO.getInstance();
		paymentDAO.setConnection(con);
		HashMap<String, Integer> weekCashSales = paymentDAO.getWeekCashSales();
		close(con);
		return weekCashSales;
	}
	
}
