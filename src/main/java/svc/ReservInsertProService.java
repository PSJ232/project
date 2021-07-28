package svc;

import java.sql.Connection;

import dao.ReservDAO;
import vo.ReservBean;

import static db.JdbcUtil.*;

public class ReservInsertProService {

	public boolean insertReserv(ReservBean rb) {
		System.out.println("ReservInsertProService - insertReserv");
		boolean isInsertReservSuccess = false;
		int insertCount = 0;
		
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		insertCount = reservDAO.insertReserv(rb);
		
		if(insertCount>0) {
			commit(con);
			isInsertReservSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertReservSuccess;
	}

}
