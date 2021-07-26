package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;
import static db.JdbcUtil.*;

public class ReviewListService {

	public ArrayList<ReviewBean> selectReviewList(int i_id) {
		System.out.println("ReviewListService - getReviewList()");
		ArrayList<ReviewBean> rbList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
		rbList = rdao.getReviewList(i_id);
		
		close(con);
		
		return rbList;
	}

}
