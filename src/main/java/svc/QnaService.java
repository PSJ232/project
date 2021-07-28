package svc;

import java.sql.Connection;

import dao.QnaDAO;
import db.JdbcUtil;
import vo.QnaBean;

public class QnaService {

	public boolean askQna(QnaBean qnaBean) {
		
		boolean isInsertSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		int insertCount = qnaDAO.insertQna(qnaBean);
		
		if(insertCount > 0) {
			JdbcUtil.commit(con);
			isInsertSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		
		return isInsertSuccess;
	}


}
