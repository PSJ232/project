package svc;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;
import vo.CartBean;

public class CartUpdateProService {

	public boolean modifyCart(CartBean cartBean) {
		
		boolean isUpdateSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		int updateCount = cartDAO.modifyCart(cartBean);
		
		if(updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		
		return isUpdateSuccess;
	}

}
