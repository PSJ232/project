package svc;

import java.sql.Connection;
import java.sql.Time;
import java.util.ArrayList;

import dao.ClassDetailDAO;

import static db.JdbcUtil.*;

public class ClassDetailSelectTimelistService {
	public ArrayList<Time> getSelectableTimeList(String place, String date) {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		
		ArrayList<Time> timeList = classDetailDAO.getSelectableTimeList(place, date);
		
		close(con);
		
		return timeList;
	}

	public ArrayList<Time> getSelectedTimeList(int f_id) {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		
		ArrayList<Time> timeList = classDetailDAO.getSelectedTimeList(f_id);
		close(con);
		return timeList;
	}

}
