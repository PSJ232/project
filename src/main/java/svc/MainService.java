package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

public class MainService {

	public ArrayList<ItemBean> geItemList(int i) {
		System.out.println("MainService - geItemList");
		ArrayList<ItemBean> itemList = null;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		itemList = itemDAO.getItemList(i);
		
		close(con);
		return itemList;
	}

	
	public ArrayList<ItemBean> getItemListLimit6(int i) {
		System.out.println("MainService - geItemList");
		ArrayList<ItemBean> itemList = null;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		itemList = itemDAO.getItemListLimit6(i);
		
		close(con);
		return itemList;
	}

}
