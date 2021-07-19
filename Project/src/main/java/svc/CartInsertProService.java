package svc;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;
import vo.CartBean;


public class CartInsertProService {

	public boolean putCart(CartBean cartBean) {
		
		boolean isInsertSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		int insertCount = cartDAO.insertCart(cartBean);
		
		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isInsertSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		
		JdbcUtil.close(con);
		
		
		return isInsertSuccess;
	}

}
