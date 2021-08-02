package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import dao.CartDAO;
import dao.QnaDAO;
import db.JdbcUtil;
import vo.CartBean;
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
	
	public ArrayList<QnaBean> getQnaList(String m_id) {

		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);

		ArrayList<QnaBean> qnaList = qnaDAO.selectQnaList(m_id);

		JdbcUtil.close(con);

		return qnaList;
	
	}

	public ArrayList<QnaBean> getBeforeQnaList() {
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		ArrayList<QnaBean> qnaList = qnaDAO.getBeforeQnaList();
		JdbcUtil.close(con);

		return qnaList;
	}

	public ArrayList<QnaBean> getAfterClassList() {
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		ArrayList<QnaBean> qnaList = qnaDAO.getAfterQnaList();
		JdbcUtil.close(con);

		return qnaList;
	}

	public boolean deleteAnswer(int q_id, int q_re_ref) {
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		boolean isDeleteSuccess = false; 
		int deleteCount = qnaDAO.deleteAnswer(q_id, q_re_ref);
		if(deleteCount > 0) {
			JdbcUtil.commit(con);
			isDeleteSuccess = true;
		}else {
			JdbcUtil.rollback(con);
		}
		JdbcUtil.close(con);
		return isDeleteSuccess;
	}


}
