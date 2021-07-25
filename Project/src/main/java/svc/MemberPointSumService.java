package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberPointSumService {

	public boolean sumPoint(String m_id, int newPoint) {
		System.out.println("MemberPointSumService - sumPoint()");
		boolean isSumPointSuccess = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		MemberBean memberDetail = memberDAO.getMember(m_id);
		int nowPoint = memberDetail.getM_point();

		int updatePoint = nowPoint + newPoint;

		int updateCount = memberDAO.updatePoint(m_id, updatePoint);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isSumPointSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isSumPointSuccess;
	}

}
