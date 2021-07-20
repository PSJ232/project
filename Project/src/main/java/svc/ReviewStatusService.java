package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.OrderBean;
import static db.JdbcUtil.*;


public class ReviewStatusService {

	public ArrayList<OrderBean> reviewNonStatus(String m_id) {
		
		System.out.println("MemberDetailService - reviewNonStatus()");
		ArrayList<OrderBean> nonArrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
//		nonArrayList = rdao.getReviewNonStatus(m_id);
		
		close(con);
		
		return nonArrayList;
	}
	
	public ArrayList<OrderBean> revieStatus(String m_id) {
		
		System.out.println("MemberDetailService - reviewStatus()");
		ArrayList<OrderBean> arrayList = null;
		
		Connection con = getConnection();
		ReviewDAO rdao = ReviewDAO.getInstance();
		rdao.setConnection(con);
		
//		arrayList = rdao.getReviewStatus(m_id);
		
		close(con);
		
		return arrayList;
	}

}
