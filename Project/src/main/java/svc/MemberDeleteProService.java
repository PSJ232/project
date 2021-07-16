package svc;

import java.sql.Connection;
import dao.MemberDAO;
import static db.JdbcUtil.*;

import static db.JdbcUtil.getConnection;

public class MemberDeleteProService {
	public boolean dropMember(String m_id, String m_pass) {
		System.out.println("MemberUpdateProService - dropMember()");
		//  글쓰기 작업 요청 처리 결과를 저장할 boolean 타입 변수 선언
		boolean isDeleteSuccess = false;
		
		// 공통작업 1. connection 객체 받아오기
		Connection con = getConnection();
		// 공통작업 2. MemberDAO 객체 호출하기
		MemberDAO mdao = MemberDAO.getInstance();
		
		// 공통작업 3. MemberDAO 객체에 Connection 전달
		mdao.setConnection(con);
		
		// 공통작업 4. MemberDAO 객체 중 deleteMember() 수행
		int deleteCount = mdao.deleteMember(m_id, m_pass);
		
		// +) 작업 성공 여부에 따라 commit, rollback 수행
		if(deleteCount >0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		// 공통작업 5. connection 객체 반환
		close(con);
		
		return isDeleteSuccess;
	}
}