package svc;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;

public class CartDeleteProSerivce {

	public boolean dropItem(int c_id) {
		System.out.println("CartDeleteProSerivce - dropItem()");
		boolean isItemDeleteSuccess = false;

		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);

		int deleteCount = cartDAO.deleteItem(c_id);

		if (deleteCount > 0) {
			JdbcUtil.commit(con);
			isItemDeleteSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isItemDeleteSuccess;
	}

}
