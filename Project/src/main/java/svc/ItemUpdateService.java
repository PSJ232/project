package svc;

import java.sql.Connection;

import dao.ItemDAO;

import static db.JdbcUtil.*;

import vo.ItemBean;

public class ItemUpdateService {

	public boolean updateItem(ItemBean ib) {
		int updateCount = 0;
		boolean isUpdateCount;

		Connection con = getConnection();

		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);

		updateCount = itemDAO.updateItem(ib);

		if (updateCount > 0) {
			isUpdateCount = true;
			commit(con);
		} else {
			isUpdateCount = false;
			rollback(con);
		}
		close(con);
		return isUpdateCount;
	}

	public boolean modifyInven(int i_id, int od_qty) {
		int updateCount = 0;
		boolean isUpdateCount;

		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		updateCount = itemDAO.updateInven(i_id, od_qty);

		if (updateCount > 0) {
			isUpdateCount = true;
			commit(con);
		} else {
			isUpdateCount = false;
			rollback(con);
		}
		close(con);
		return isUpdateCount;
	}

}
