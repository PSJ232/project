package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ItemDAO;

public class ItemDeleteService {

	public boolean deleteItem(int i_id) {
		
		int deleteCount = 0;
		boolean isDeleteSuccess;
		
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		deleteCount = itemDAO.deleteItem(i_id);
		
		if(deleteCount>0) {
			isDeleteSuccess = true;
			commit(con);
		} else {
			isDeleteSuccess = false;
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}

}
