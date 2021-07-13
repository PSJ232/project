package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberLoginProService {
	
	public boolean checkMember(MemberBean memberBean) {
		System.out.println("MemberLoginProService - checkMember");
		
		// 1. 로그인 요청 처리 결과를 저장할 boolean 타입 변수 선언
		boolean isLoginSuccess = false;
		
		// 2. JdbcUtil 객체로부터 Connection Pool 에 저장된 Connection 객체 가져오기(공통)
		Connection con = JdbcUtil.getConnection();
		
		// 3. memberDAO 클래스로부터 memberDAO 객체 가져오기(공통)
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// 4. memberDAO 객체의 setConnection() 메서드를 호출하여 Connection 객체 전달(공통)
		memberDAO.setConnection(con);
		
		// 5. memberDAO 객체의 XXX() 메서드를 호출하여 XXX 작업 수행 및 결과 리턴받기
		int insertCount = memberDAO.userCheck(memberBean);
		
		// 6. 리턴받은 결과에 따라 commit, rollback 결정
		if(insertCount > 0) {
			JdbcUtil.commit(con);
			isLoginSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		// 7. 작업 수행 후 Connection 객체 반환(공통)
		JdbcUtil.close(con);
		
		// 8. 회원정보입력 결과 리턴
		return isLoginSuccess;
		
	}

}
