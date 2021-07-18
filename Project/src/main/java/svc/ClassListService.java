package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class ClassListService {

	public ArrayList<ClassBean> getClassList() {
		Connection con = getConnection();
		
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		ArrayList<ClassBean> classList = classDAO.getClassList();
		close(con);
		return classList;
	}

}
