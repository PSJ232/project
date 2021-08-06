package svc;

import vo.MemberBean;
import vo.OrderBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dao.OrderDAO;
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

	public int getListCount() {
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int listCount = reviewDAO.getListCount();
		return listCount;
	}
}
