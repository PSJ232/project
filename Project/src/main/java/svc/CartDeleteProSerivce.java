package svc;

import java.sql.Connection;

import dao.CartDAO;
import db.JdbcUtil;

public class CartDeleteProSerivce {

	public boolean dropItem(String m_id, int i_id) {
		
		boolean isItemDeleteSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		int deleteCount = cartDAO.deleteItem(m_id, i_id);
		
		if(deleteCount > 0) {
			JdbcUtil.commit(con);
			isItemDeleteSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		
		
		return isItemDeleteSuccess;
	}

	public boolean dropLetter(String m_id, int i_id, int c_letter) {
		
		boolean isLetterDeleteSuccess = false;
		Connection con = JdbcUtil.getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		int deleteCount = cartDAO.deleteLetter(m_id, i_id, c_letter);
		
		if(deleteCount > 0) {
			JdbcUtil.commit(con);
			isLetterDeleteSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		
		
		JdbcUtil.close(con);
		
		return isLetterDeleteSuccess;
	}

}
