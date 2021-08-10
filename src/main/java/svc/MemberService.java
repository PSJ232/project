package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;
import vo.ReviewBean;

public class MemberService {

	public boolean registMember(MemberBean memberBean) {
		System.out.println("MemberService - registMember()");

		boolean isJoinSuccess = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		int insertCount = memberDAO.insertMember(memberBean);

		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isJoinSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isJoinSuccess;
	}

	public boolean checkMember(String m_id, String m_pass) {
		System.out.println("MemberService - checkMember()");

		boolean isLoginSuccess = false;

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		int insertCount = memberDAO.userCheck(m_id, m_pass);

		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isLoginSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}

		JdbcUtil.close(con);

		return isLoginSuccess;

	}

	public boolean dropMember(String m_id, String m_pass) {
		System.out.println("MemberService - dropMember()");
		boolean isDeleteSuccess = false;

		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();

		mdao.setConnection(con);

		int deleteCount = mdao.deleteMember(m_id, m_pass);

		if (deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);

		return isDeleteSuccess;
	}

	public boolean modifyMember(MemberBean memberBean) {
		System.out.println("MemberService - modifyMember()");

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
	
	public MemberBean selectMember(String m_id) {

		System.out.println("MemberService - selectMember()");

		MemberBean memberDetail = null;

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		memberDetail = memberDAO.getMember(m_id);

		JdbcUtil.close(con);

		return memberDetail;
	}
	
	// 아이디 찾기
	public String selectId(String m_phone) {
		System.out.println("MemberService - selectId()");

		String myId = null;

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		myId = memberDAO.findId(m_phone);

		JdbcUtil.close(con);

		return myId;
	}
	
	// 회원등급에 따른 할인율을 가져옴
	public float getGradeDetail(int g_id) {
		System.out.println("MemberService - getGradeDetail()");

		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		float g_discount = memberDAO.selectGradeDetail(g_id);

		JdbcUtil.close(con);

		return g_discount;
	}

	// 회원의 포인트 내역 가져옴
	public ArrayList<ReviewBean> selectMemberPointList(String m_id) {
		System.out.println("MemberService - getGradeDetail()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<ReviewBean> pbList = memberDAO.getMemberPointList(m_id); 
		
		JdbcUtil.close(con);
		
		return pbList;
	}


	// 회원의 정기구독 리스트 가져옴
	public ArrayList<Integer> selectSubscribe(String m_id) {
		System.out.println("MemberService - selectSubscribe()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<Integer> subscribeList = memberDAO.getSubscribeCount(m_id);
	
		JdbcUtil.close(con);
				
		return subscribeList;
	}

	public ArrayList<Integer> selectPurchaseCount(String m_id) {
		System.out.println("MemberService - selectPurchaseCount()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<Integer> purchaseCount = memberDAO.getPurchaseCount(m_id);
	
		JdbcUtil.close(con);
				
		return purchaseCount;
	}

	public ArrayList<Integer> selectMakingCount(String m_id) {
		System.out.println("MemberService - selectMakingCount()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<Integer> MakingCount = memberDAO.getMakingCount(m_id);
	
		JdbcUtil.close(con);
				
		return MakingCount;
	}

	public ArrayList<Integer> selectSendCount(String m_id) {
		System.out.println("MemberService - selectSendCount()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<Integer> sendCount = memberDAO.getSendCount(m_id);
	
		JdbcUtil.close(con);
				
		return sendCount;
	}
	
	public String getName(String m_id) {
		System.out.println("MemberService - getName()");
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		String name = memberDAO.getName(m_id);
	
		JdbcUtil.close(con);
				
		return name;
	}

}
