package svc;

import vo.ClassBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDAO;

public class ClassInsertService {

	public boolean insertClass(ClassBean classBean, String[] timeList) {
		Connection con = getConnection();
		boolean isSuccess = false;
		
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		int insertCount = classDAO.insertClass(classBean, timeList);
		if(insertCount == timeList.length) {
			commit(con);
			isSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isSuccess;
	}
	
}
