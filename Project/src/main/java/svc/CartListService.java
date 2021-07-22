package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CartDAO;
import db.JdbcUtil;
import vo.CartBean;

public class CartListService {

	public ArrayList<CartBean> selectCart(String m_id) {
		System.out.println("CartListService - selectCart()");

		ArrayList<CartBean> cartList = null;

		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		cartList = cartDAO.getCart(m_id);

		JdbcUtil.close(con);

		return cartList;

	}
	
	// 오버로딩 - 매개변수 데이터타입 다름
	public CartBean selectCart(int c_id) {
		System.out.println("CartListService - selectCart()");

		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		CartBean cartDetail = cartDAO.getCart(c_id);

		JdbcUtil.close(con);

		return cartDetail;
		
	}

}
