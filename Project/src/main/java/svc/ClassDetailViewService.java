package svc;

import java.sql.Connection;
import java.sql.Time;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class ClassDetailViewService {
	public ClassBean getDetailContent(int class_num) {
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ClassBean classBean = classDAO.getDetailContent(class_num);
		close(con);
		return classBean;
	}

	public ArrayList<Time> getTimeList(int class_num, String class_place) {
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<Time> timeList = classDAO.getTimeList(class_num, class_place);
		close(con);
		return timeList;
	}
}
