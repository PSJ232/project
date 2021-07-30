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
	
	// 오버로딩 - 정렬 매개변수
	public ArrayList<ItemBean> getItemList(int sort) {
		System.out.println("ItemListService - getItemList(int sort)");
		ArrayList<ItemBean> itemList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		// 1 추천순, 2 인기순, 3 신상품순
		
		if (sort == 3) {
			itemList = itemDAO.selectItemList(3);
			System.out.println("신상품순 정렬");
		} else if (sort == 2) {
			itemList = itemDAO.selectItemList(2);
			System.out.println("인기순 정렬");
		} else if (sort == 1) {
			itemList = itemDAO.selectItemList(1);
			System.out.println("추천순 정렬");
		}
		
		close(con);

		return itemList;
	}
}
