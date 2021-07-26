package svc;

import vo.MemberBean;
import vo.OrderBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;

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
}
