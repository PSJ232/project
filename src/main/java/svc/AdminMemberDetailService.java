package svc;

import vo.MemberBean;
import vo.OrderBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dao.ReviewDAO;

public class AdminMemberDetailService {
	public MemberBean getMemberDetail(String m_id) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberBean memberBean = memberDAO.getMemberDetail(m_id);
		close(con);
		return memberBean;
	}
	
//	public ArrayList<OrderBean> getMemberOrders(String m_id) {
//		Connection con = getConnection();
//		MemberDAO memberDAO = MemberDAO.getInstance();
//		memberDAO.setConnection(con);
//		ArrayList<OrderBean> orderList = memberDAO.getMemberOrders(m_id);
//		close(con);
//		return orderList;
//	}
	
	public String getJSON(int r_id) {
		Connection con = getConnection();
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		String content = reviewDAO.getContent(r_id);
		result.append("{\"value\": \"" + content + "\"},");
		result.append("]}");
		close(con);
		
		return result.toString();
	}
}
