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
			String sql = "INSERT INTO qna VALUES(?,?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qnaBean.getQ_id());
			pstmt.setInt(2, qnaBean.getO_id());
			pstmt.setString(3, qnaBean.getQ_subject());
			pstmt.setString(4, qnaBean.getQ_content());
			pstmt.setString(5, qnaBean.getQ_img());
			pstmt.setString(6, qnaBean.getQ_img2());
			pstmt.setString(7, qnaBean.getQ_img3());
			pstmt.setString(8, qnaBean.getM_id());
			
			
			
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
			String sql = "SELECT * FROM qna where m_id=?";
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
				qnaBean.setQ_rdate(rs.getDate("q_rdate"));
				qnaBean.setQ_img(rs.getString("q_img"));
				qnaBean.setQ_img2(rs.getString("q_img2"));
				qnaBean.setQ_img3(rs.getString("q_img3"));
				
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
}
