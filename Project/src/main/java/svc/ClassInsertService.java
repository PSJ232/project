package svc;

import vo.ClassBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDAO;

public class ClassInsertService {

	public boolean registArticle(ClassBean classBean) {
		Connection con = getConnection();
		boolean isSuccess = false;
		
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		
		int insertCount = classDAO.insertClass(classBean);
		if(insertCount > 0) {
			commit(con);
			isSuccess = true;
		}else {
			rollback(con);
		}
		return isSuccess;
	}

}
