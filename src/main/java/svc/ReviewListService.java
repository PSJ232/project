package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.DetailBean;
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
	
	public ArrayList<DetailBean> getMemberReviewList(String m_id){
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		ArrayList<DetailBean> reviewList = reviewDAO.getMemberReviewList(m_id);
		close(con);
		return reviewList;
	}
	
	public ArrayList<ReviewBean> getReviewList(){
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		ArrayList<ReviewBean> reviewList = reviewDAO.getReviewList();
		close(con);
		return reviewList;
	}

}
