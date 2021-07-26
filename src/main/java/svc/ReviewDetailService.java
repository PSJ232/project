package svc;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;
import static db.JdbcUtil.*;

public class ReviewDetailService {

	public ReviewBean selectReview(int od_id) {
		System.out.println("ReviewDetailService - selectReview()");
		ReviewBean rb = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		rb = rdao.getReview(od_id);
		
		close(con);
		
		return rb;
	}

}
