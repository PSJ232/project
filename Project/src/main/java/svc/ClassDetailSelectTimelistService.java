package svc;

import java.sql.Connection;
import java.sql.Time;
import java.util.ArrayList;

import dao.ClassDetailDAO;

import static db.JdbcUtil.*;

public class ClassDetailSelectTimelistService {
	public ArrayList<Time> getTimeList(String place, String date) {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		
		ArrayList<Time> timeList = classDetailDAO.getTimeList(place, date);
		
		return timeList;
	}
}
