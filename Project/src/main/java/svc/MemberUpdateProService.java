package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberUpdateProService {

	public boolean modifyMember(MemberBean memberBean) {
		System.out.println("MemberUpdateProService - modifyMember()");

		boolean isUpdateSuccess = false;

		Connection con = JdbcUtil.getConnection();

		MemberDAO memberDAO = MemberDAO.getInstance();

		memberDAO.setConnection(con);

		int updateCount = memberDAO.updateMember(memberBean);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;

	}

}
