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

	public void changeStatus(int od_id) {
		System.out.println("ReviewInsertProService - changeStatus()");
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		
	}
	
	
}
