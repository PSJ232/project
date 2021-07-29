package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class ClassListService {

	public ArrayList<ClassBean> getStartClassList() {
		Connection con = getConnection();
		
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<ClassBean> classList = classDAO.getStartClassList();
		close(con);
		return classList;
	}

	public ArrayList<ClassBean> getEndClassList() {
		Connection con = getConnection();
		
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<ClassBean> classList = classDAO.getEndClassList();
		close(con);
		return classList;
	}

}
