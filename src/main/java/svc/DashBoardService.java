package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import dao.ItemDAO;
import dao.OrderDAO;
import dao.ReviewDAO;
import vo.ItemBean;
import vo.ReviewBean;

public class DashBoardService {

	public HashMap<String, Integer> getSalesInfo() {
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		HashMap<String, Integer> salesInfo = orderDAO.getSalesInfo();
		close(con);
		return salesInfo;
	}

	public HashMap<String, Integer> getWeekCardSales() {
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		HashMap<String, Integer> weekCardSales = orderDAO.getWeekCardSales();
		close(con);
		return weekCardSales;
	}
	public HashMap<String, Integer> getWeekCashSales() {
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		HashMap<String, Integer> weekCashSales = orderDAO.getWeekCashSales();
		close(con);
		return weekCashSales;
	}

	public ArrayList<ItemBean> getItemRanking() {
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		ArrayList<ItemBean> rankingItems = itemDAO.getItemRanking();
		close(con);
		return rankingItems;
	}

	public ArrayList<ReviewBean> getRecentReview() {
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		ArrayList<ReviewBean> recentReview = reviewDAO.getRecentReview();
		close(con);
		return recentReview;
	}
	
}
