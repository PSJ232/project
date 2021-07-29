package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemListService {
	
	public ArrayList<ItemBean> getItemList() {
		System.out.println("ItemListService - getItemList()");
		//DB작업 후 반환할 변수 선언
		ArrayList<ItemBean> itemList = null;
		//Connection 객체 가져오기
		Connection con = getConnection();
		
		
		//DAO 객체 생성해서 Connection 객체 전달
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		
		//DB작업 후 반환값을 변수에 저장
		itemList = itemDAO.selectItemList();
		
		close(con);

		return itemList;
	}
}
