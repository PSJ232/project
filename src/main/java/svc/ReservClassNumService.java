package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDAO;
import dao.ClassDetailDAO;
import dao.ItemDAO;
import dao.ReservDAO;
import vo.ClassDetailBean;
import vo.ItemBean;

public class ReservClassNumService {

	public int getMaxNum(int f_id) {
		System.out.println("ReservClassNumService - getMaxNum(int f_id)");
		//각 클래스당 최대 수강 인원수
		int f_maxmem = 0;
		
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		f_maxmem = classDAO.getMaxmem(f_id);
		
		close(con);
		
		return f_maxmem;
	}

	public int getClassDetailId(ClassDetailBean cdb, String fd_time) {
		System.out.println("ReservClassNumService - getClassDetailId(ClassDetailBean cdb)");
		//classdetil
		int fd_id = 0;
		System.out.println("============================시간: " + fd_time);
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);		
		
		fd_id = classDetailDAO.getClassDetailId(cdb, fd_time);
		
		close(con);
		
		return fd_id;
	}

	public int getCurrentNum(int fd_id) {
		System.out.println("ReservClassNumService - getCurrentNum(int fd_id)");
		int currentNum = 0;
		
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		
		currentNum = reservDAO.getCurrentNum(fd_id);
		
		close(con);
		
		return currentNum;
	}

	
}
