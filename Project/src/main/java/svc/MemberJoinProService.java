package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberJoinProService {
	
	public boolean registMember(MemberBean memberBean) {
		System.out.println("MemberJoinProService - registMember()");
		boolean isJoinSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int insertCount = memberDAO.insertMember(memberBean);
		
		if(insertCount > 0) {
			JdbcUtil.commit(con);
			isJoinSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		
		return isJoinSuccess;
	}
}
