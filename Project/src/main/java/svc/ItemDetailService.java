package svc;


import java.sql.Connection;

import dao.ItemDAO;
import db.JdbcUtil;
import vo.ItemBean;

public class ItemDetailService { // 아이템에 대한 디테일이 필요할 경우 사용

	public ItemBean selectItem(String i_id) {
		System.out.println("ItemDetailService - selectItem()");
		
		ItemBean itemDetail = null;
		
		Connection con = JdbcUtil.getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		itemDetail = itemDAO.getItem(i_id);
		
		JdbcUtil.close(con);
		
		
		return itemDetail;
	}

}
