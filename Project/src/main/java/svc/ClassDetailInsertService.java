package svc;

import vo.ClassDetailBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ClassDetailDAO;

public class ClassDetailInsertService {

	public boolean registArticle(ClassDetailBean classDetailBean, String[] timeList) {
		Connection con = getConnection();
		ClassDetailDAO classDetailDAO = ClassDetailDAO.getInstance();
		classDetailDAO.setConnection(con);
		boolean isInsertSuccess = false;
		int countInsert = classDetailDAO.insertClassDetail(classDetailBean, timeList);
		if(countInsert == timeList.length) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return isInsertSuccess;
	}

}
