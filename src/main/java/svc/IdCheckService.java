package svc;

import vo.MemberBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;

public class IdCheckService {

	public MemberBean checkMemberId(String m_id) {
		System.out.println("IdCheckService - checkMemberId()");
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberBean memberBean = memberDAO.getMemberDetail(m_id);
		
		close(con);
		
		return memberBean;
	}

}
