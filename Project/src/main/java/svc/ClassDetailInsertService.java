package svc;

import vo.ClassDetailBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDetailDAO;

public class ClassDetailInsertService {

	public boolean registArticle(ClassDetailBean classDetailBean) {
		boolean isDetailWriteSuccess = false;
		Connection con = getConnection();
		
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		int insertClassDetailCount = classDetailDAO.insertClassDetail(classDetailBean);
		
		if(insertClassDetailCount > 0) {
			commit(con);
			isDetailWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isDetailWriteSuccess;
	}

}
