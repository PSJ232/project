package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.ClassDetailDAO;
import dao.ReservDAO;
import vo.ReservBean;

import static db.JdbcUtil.*;

public class ReservSelectIdService {

	public int getrId(ReservBean rb) {
		int r_id = 0;
		System.out.println("ReservSelectIdService - getrId(ReservBean rb)");
		ReservBean reservBean = null;
		//Conneciton 객체 전달
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		r_id = reservDAO.getrId(rb);
		
		close(con);
		
		return r_id;
	}

}
