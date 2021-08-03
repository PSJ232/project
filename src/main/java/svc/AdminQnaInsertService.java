package svc;

import vo.QnaBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnaDAO;

public class AdminQnaInsertService {

	public boolean qnaWrite(QnaBean qnaBean) {
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		int insertCount = qnaDAO.qnaWrite(qnaBean);
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
		 
	}

}
