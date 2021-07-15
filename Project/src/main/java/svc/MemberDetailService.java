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

}
