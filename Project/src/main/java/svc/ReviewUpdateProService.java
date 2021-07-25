package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewUpdateProService {

	public boolean modifyReview(ReviewBean rb) {
		System.out.println("ReviewUpdateProService - modifyReview()");
		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		int modifyCount = rdao.updateReview(rb);
		
		if(modifyCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUpdateSuccess;
	}

}
