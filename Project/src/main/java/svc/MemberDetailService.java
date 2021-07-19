package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberDetailService {

	public MemberBean selectMember(String m_id) {

		System.out.println("MemberDetailService - selectMember()");

		MemberBean memberDetail = null;

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		memberDetail = memberDAO.getMember(m_id);

		JdbcUtil.close(con);

		return memberDetail;
	}

	public String selectId(String m_phone) {

		System.out.println("MemberDetailService - selectId()");

		String myId = null;

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		myId = memberDAO.findId(m_phone);

		JdbcUtil.close(con);

		return myId;
	}

}
