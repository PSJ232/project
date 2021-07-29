package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemListService {
	
	public ArrayList<ItemBean> getItemList() {
		System.out.println("ItemListService - getItemList()");
		ArrayList<ItemBean> itemList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		itemList = itemDAO.selectItemList();
		
		close(con);

		return itemList;
	}
}
