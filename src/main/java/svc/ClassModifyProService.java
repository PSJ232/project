package svc;

import java.sql.Connection;

import dao.ClassDAO;
import vo.ClassBean;
import static db.JdbcUtil.*;

public class ClassModifyProService {

	public boolean modifyClass(ClassBean classBean, String[] timeList) {
		boolean isModifySuccess = false;
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		int modifyCount = classDAO.modifyClass(classBean, timeList);
		if(modifyCount > 0) {
			commit(con);
			isModifySuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isModifySuccess;
	}
	
}
