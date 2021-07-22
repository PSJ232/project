package svc;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;

public class CartUpdateProService {

	public boolean modifyCart(int c_id, int c_qty) {
		System.out.println("CartUpdateProService - modifyCart()");
		boolean isUpdateSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int updateCount = cartDAO.updateCart(c_id, c_qty);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

	public boolean modifyLetter(int c_id, int c_letter) {
		System.out.println("CartUpdateProService - modifyLetter()");
		boolean isUpdateSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int updateCount = cartDAO.deleteLetter(c_id, c_letter);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

}
