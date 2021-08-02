package svc;

import vo.QnaBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnaDAO;

public class AdminQnaDetailService {

	public QnaBean getQnaDetail(int q_id) {
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		QnaBean qnaBean = qnaDAO.getQnaDetail(q_id);
		close(con);
		return qnaBean;
	}

}
