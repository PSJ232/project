package svc;

import vo.ReviewBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;

public class ReviewInsertProService {
	
	public boolean registerReview(ReviewBean rb) {
		System.out.println("ReviewInsertProService - registerMember()");
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		int insertCount = rdao.insertReview(rb);
		
		if(insertCount > 0) {
			commit(con);
			isInsertSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertSuccess;
	}

	public boolean modifyMemberPoint(String m_id, int r_point) {
		System.out.println("ReviewInsertProService - modifyMemberPoint()");
		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		int updateCount = rdao.updateMemberPoint(m_id, r_point);
		
		if(updateCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUpdateSuccess;
	}
	
	
}
