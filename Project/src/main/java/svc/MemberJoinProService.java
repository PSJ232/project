package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

// 실제 비즈니스 로직 처리를 위해 DAO 클래스에 DB 작업 요청하는 역할의 Service 클래스 정의
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
