package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.AnniversaryBean;

public class MemberAnniversaryService {

	public boolean registAnn(AnniversaryBean anniversaryBean) {
		System.out.println("MemberAnniversaryService - registAnn()");
		boolean isInsertSuccess = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		int insertCount = memberDAO.insertAnn(anniversaryBean);

		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isInsertSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isInsertSuccess;
	}

	public ArrayList<AnniversaryBean> getAnnList(String m_id) {
		System.out.println("MemberAnniversaryService - getAnnList()");

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		ArrayList<AnniversaryBean> annList = memberDAO.selectAnnList(m_id);

		JdbcUtil.close(con);

		return annList;
	}

	public boolean dropAnn(int a_id) {
		System.out.println("MemberAnniversaryService - dropAnn()");

		boolean isDeleteSuccess = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		int deleteCount = memberDAO.deleteAnn(a_id);

		if (deleteCount > 0) {
			JdbcUtil.commit(con);
			isDeleteSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isDeleteSuccess;
	}

	public boolean modifyAnn(AnniversaryBean anniversaryBean) {
		System.out.println("MemberAnniversaryService - modifyAnn()");

		boolean isUpdateSuccess = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		int updateCount = memberDAO.updateAnn(anniversaryBean);

		if (updateCount > 0) {
			JdbcUtil.commit(con);
			isUpdateSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isUpdateSuccess;
	}

	public AnniversaryBean getAnn(int a_id) {
		System.out.println("MemberAnniversaryService - getAnn()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		AnniversaryBean annDetail = memberDAO.selectAnn(a_id);

		JdbcUtil.close(con);

		return annDetail;
	}

}
