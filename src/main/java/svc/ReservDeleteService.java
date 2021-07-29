package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.ClassDetailDAO;
import dao.ReservDAO;
import vo.ClassDetailBean;
import static db.JdbcUtil.*;

public class ReservDeleteService {

	public boolean deleteReserv(int r_id) {
		boolean isDeleted = false;
		int deleteCount = 0;
		
		System.out.println("ReservDeleteService - deleteReserv(int r_id)");
		//Conneciton 객체 전달
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		
		deleteCount = reservDAO.deleteReserv(r_id);
		if(deleteCount>0) {
			commit(con);
			isDeleted = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleted;
	}

}
