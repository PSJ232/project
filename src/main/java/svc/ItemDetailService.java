package svc;

import dao.ItemDAO;
import vo.ItemBean;

import java.sql.Connection;
import static db.JdbcUtil.*;

public class ItemDetailService {
	public ItemBean selectItem(int i_id) {
		System.out.println("ItemDetailService - selectItem()");
		
		ItemBean itemDetail = null;
		
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		itemDetail = itemDAO.getItem(i_id);
		
		close(con);
		
		
		return itemDetail;
	}
}
