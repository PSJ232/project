package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;
import vo.CartBean;

public class CartDetailService {
	
	public CartBean selectCart(String m_id) {
		System.out.println("CartDetailService - selectCart()");
		
		CartBean cartDetail = null;
		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		cartDetail = cartDAO.getCart(m_id);
		
		JdbcUtil.close(con);
		
		return cartDetail;
		
	}

}
