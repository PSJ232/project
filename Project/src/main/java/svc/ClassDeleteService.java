package svc;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDAO;

public class ClassDeleteService {

	public boolean deleteClass(int class_num) {
		Connection con = getConnection();
		ClassDAO classDAO = ClassDAO.getInstance();
		classDAO.setConnection(con);
		boolean isDeleteSuccess = false;
		int deleteCount = classDAO.deleteClass(class_num);
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
			
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteSuccess;
	}

}
