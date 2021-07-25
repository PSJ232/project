package svc;

import java.sql.Connection;

import dao.ReviewDAO;

import static db.JdbcUtil.*;

public class ReviewDeleteProService {

	public boolean dropReview(int od_id) {
		System.out.println("ReviewDeleteProService - dropReview()");
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		int deleteCount = rdao.deleteReview(od_id);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}

}
