package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.Timestamp;

import dao.ItemDAO;
import vo.ItemBean;

public class ItemInsertService {
	//request 
	//response db작업 성공여부
	
	public boolean insertItem(ItemBean ib) {
		System.out.println("itemInsertService - insertItem()");
		//반환값 저장할 변수 선언 및 초기화
		boolean isInsertSuccess = false;
		
		//Connection Pool에서 Connection 객체 받아서 DAO에 전달
		Connection con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		Timestamp date = new Timestamp(System.currentTimeMillis());
		ib.setI_rdate(date);
		
		//DB처리한 후 처리 성공여부 확인
		int insertCount = itemDAO.insertItem(ib);
		
		if(insertCount>0) {
			commit(con);
			close(con);
			isInsertSuccess = true;
		} else {
			rollback(con);
		}
		
		return isInsertSuccess;
	}
	
	
}
