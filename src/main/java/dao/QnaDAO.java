package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.QnaBean;

public class QnaDAO {
	

	private static QnaDAO instance;

	private QnaDAO() {}

	public static QnaDAO getInstance() {
		// 기존 MemberDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if (instance == null) {
			instance = new QnaDAO();
		}

		return instance;
	}

	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertQna(QnaBean qnaBean) {

		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO qna VALUES(?,?,?,?,?,now(),?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaBean.getQ_id());
			pstmt.setInt(2, qnaBean.getO_id());
			pstmt.setString(3, qnaBean.getQ_subject());
			pstmt.setString(4, qnaBean.getQ_content());
			pstmt.setString(5, qnaBean.getQ_img());
			pstmt.setString(6, qnaBean.getQ_img2());
			pstmt.setString(7, qnaBean.getQ_img3());
			pstmt.setString(8, qnaBean.getM_id());
			pstmt.setInt(9, qnaBean.getQ_id()); //qna_re_ref
			pstmt.setInt(10, 0); //qna_re_lev
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		
		return insertCount;
	}

	public ArrayList<QnaBean> selectQnaList(String m_id) {
		
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();;
		QnaBean qnaBean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM qna WHERE m_id=? OR m_id='admin@admin.com' ORDER BY q_re_ref, q_re_lev ASC;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				qnaBean = new QnaBean(); 
				qnaBean.setQ_id(rs.getInt("q_id"));
				qnaBean.setM_id(rs.getString("m_id"));
				qnaBean.setO_id(rs.getInt("o_id"));
				qnaBean.setQ_subject(rs.getString("q_subject"));
				qnaBean.setQ_content(rs.getString("q_content"));
				qnaBean.setQ_rdate(rs.getTimestamp("q_rdate"));
				qnaBean.setQ_img(rs.getString("q_img"));
				qnaBean.setQ_img2(rs.getString("q_img2"));
				qnaBean.setQ_img3(rs.getString("q_img3"));
				qnaBean.setQ_re_ref(rs.getInt("q_re_ref"));
				qnaBean.setQ_re_lev(rs.getInt("q_re_lev"));
				
				qnaList.add(qnaBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return qnaList;
	}

	public ArrayList<QnaBean> getBeforeQnaList() {
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM qna WHERE q_answered=0 ORDER BY q_id DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaBean qnaBean = new QnaBean();
				qnaBean.setQ_id(rs.getInt("q_id"));
				qnaBean.setO_id(rs.getInt("o_id"));
				qnaBean.setQ_subject(rs.getString("q_subject"));
				qnaBean.setQ_content(rs.getString("q_content"));
				qnaBean.setQ_img(rs.getString("q_img"));
				qnaBean.setQ_img2(rs.getString("q_img2"));
				qnaBean.setQ_img3(rs.getString("q_img3"));
				qnaBean.setM_id(rs.getString("m_id"));
				qnaBean.setQ_re_ref(rs.getInt("q_re_ref"));
				qnaBean.setQ_re_lev(rs.getInt("q_re_lev"));
				qnaBean.setQ_rdate(rs.getTimestamp("q_rdate"));
				qnaBean.setQ_answered(rs.getInt("q_answered"));
				qnaList.add(qnaBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return qnaList;
	}

	public ArrayList<QnaBean> getAfterQnaList() {
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM qna WHERE q_answered=1 ORDER BY q_re_ref DESC, q_re_lev";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaBean qnaBean = new QnaBean();
				qnaBean.setQ_id(rs.getInt("q_id"));
				qnaBean.setO_id(rs.getInt("o_id"));
				qnaBean.setQ_subject(rs.getString("q_subject"));
				qnaBean.setQ_content(rs.getString("q_content"));
				qnaBean.setQ_img(rs.getString("q_img"));
				qnaBean.setQ_img2(rs.getString("q_img2"));
				qnaBean.setQ_img3(rs.getString("q_img3"));
				qnaBean.setM_id(rs.getString("m_id"));
				qnaBean.setQ_re_ref(rs.getInt("q_re_ref"));
				qnaBean.setQ_re_lev(rs.getInt("q_re_lev"));
				qnaBean.setQ_rdate(rs.getTimestamp("q_rdate"));
				qnaBean.setQ_answered(rs.getInt("q_answered"));
				qnaList.add(qnaBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return qnaList;
	}

	public QnaBean getQnaDetail(int q_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnaBean qnaBean = null;
		try {
			String sql = "SELECT * FROM qna WHERE q_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qnaBean = new QnaBean();
				qnaBean.setQ_id(q_id);
				qnaBean.setO_id(rs.getInt("o_id"));
				qnaBean.setM_id(rs.getString("m_id"));
				qnaBean.setQ_subject(rs.getString("q_subject"));
				qnaBean.setQ_content(rs.getString("q_content"));
				qnaBean.setQ_img(rs.getString("q_img"));
				qnaBean.setQ_img2(rs.getString("q_img2"));
				qnaBean.setQ_img3(rs.getString("q_img3"));
				qnaBean.setQ_rdate(rs.getTimestamp("q_rdate"));
				qnaBean.setQ_re_ref(rs.getInt("q_re_ref"));
				qnaBean.setQ_re_lev(rs.getInt("q_re_lev"));
				qnaBean.setQ_answered(rs.getInt("q_answered"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return qnaBean;
	}

	public int qnaWrite(QnaBean qnaBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		try {
			int num = 1;
			String sql = "SELECT MAX(q_id) FROM qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
				num++;
			}
			JdbcUtil.close(pstmt);
			sql = "UPDATE qna SET q_answered=1 WHERE q_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaBean.getQ_id());
			pstmt.executeUpdate();
			JdbcUtil.close(pstmt);
			sql = "INSERT INTO qna VALUES(?,?,?,?,null,now(),null,null,?,?,1,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, qnaBean.getO_id());
			pstmt.setString(3, qnaBean.getQ_subject());
			pstmt.setString(4, qnaBean.getQ_content());
			pstmt.setString(5, qnaBean.getM_id());
			pstmt.setInt(6, qnaBean.getQ_id());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return insertCount;
	}

	public int deleteAnswer(int q_id, int q_re_ref) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		try {
			String sql = "DELETE FROM qna WHERE q_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			deleteCount = pstmt.executeUpdate();
			JdbcUtil.close(pstmt);
			sql = "UPDATE qna SET q_answered=0 WHERE q_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_re_ref);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		}finally {
			JdbcUtil.close(pstmt);
		}
		
		return deleteCount;
	}
}
