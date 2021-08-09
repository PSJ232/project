package svc;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;

public class AdminDeleteReviewService {

	public boolean deleteAdminReview(int r_id) {
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int deleteCount = reviewDAO.deleteAdminReview(r_id);
		boolean isDeleteSuccess = false;
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
