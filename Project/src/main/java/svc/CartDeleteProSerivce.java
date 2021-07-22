package svc;

import java.sql.Connection;

import db.JdbcUtil;

public class CartDeleteProSerivce {

	public boolean dropCart(String m_id, int i_id) {
		
		boolean isDeleteSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		
		
		return isDeleteSuccess;
	}

}
