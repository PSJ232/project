package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import dao.ClassDetailDAO;
import dao.ReservDAO;
import vo.ClassBean;
import vo.ReservBean;

public class MypageClassService {

	public ArrayList<ReservBean> getClassId(String m_id) {
		System.out.println("MypageClassService - getClassId(String m_id)");
		//반환값 저장할 변수 선언 및 초기화
		ArrayList<ReservBean> reservList = null;
		
		//Connection Pool에서 Connection 객체 받아서 DAO에 전달
		Connection con = getConnection();
		ReservDAO reservDAO = ReservDAO.getInstance();
		reservDAO.setConnection(con);
		
		reservList = reservDAO.getReservList(m_id);
		
		close(con);
		
		return reservList;
	}

	public ClassBean getMyClassInfo(int f_id) {
		System.out.println("MypageClassService - getClassId(String m_id)");
		//반환값 저장할 변수 선언 및 초기화
		ClassBean myClassInfo = null;
		
		//Connection Pool에서 Connection 객체 받아서 DAO에 전달
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		myClassInfo = classDAO.getMyClassInfo(f_id);
		
		close(con);
		return myClassInfo;
	}

	public int getMyClassTime(int fd_id) {
		System.out.println("MypageClassService - getMyClassTime(int fd_id)");
		int myClassTime = 0;
		
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		
		myClassTime = classDetailDAO.getClassTime(fd_id);
		
		close(con);
		
		return myClassTime;
	}
	
}
