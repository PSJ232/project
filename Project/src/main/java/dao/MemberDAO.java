package dao;

import java.io.Closeable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberBean;

import static db.JdbcUtil.*;
// 실제 데이터베이스 작업(비즈니스 로직)을 수행하는 MemberDAO 클래스 정의
public class MemberDAO {
	
	private static MemberDAO instance;
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		// 기존 BoardDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if(instance == null) {
			instance = new MemberDAO();
		}
		
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 회원정보입력 작업(비즈니스 로직)을 수행하기 위한 insertMember() 메서드 정의
	public int insertMember(MemberBean memberBean) {
		
		System.out.println("MemberDAO - insertMember()");
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member(m_id,m_pass,m_name,m_phone,m_birth,m_gender,g_id,m_agree,m_rdate)"
					+ " VALUES(?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberBean.getM_id());// 아이디=이메일
			pstmt.setString(2, memberBean.getM_pass());
			pstmt.setString(3, memberBean.getM_name());
			pstmt.setString(4, memberBean.getM_phone());
			pstmt.setString(5, memberBean.getM_birth());
			pstmt.setInt(6, memberBean.getM_gender());
			pstmt.setInt(7, 0);//회원등급 기본값 0
			pstmt.setString(8, memberBean.getM_agree());//동의:on, 비동의:null
			// 최근배송지, 회원탈퇴는 null값
			// 가입날짜는 자동입력
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 로그인 작업(비즈니스 로직)을 수행하기 위한 userCheck() 메서드 정의
//	public int userCheck(MemberBean memberBean) {
	public int userCheck(MemberBean memberBean) {	
		System.out.println("MemberDAO - userCheck()");
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "SELECT * FROM member WHERE m_id=? and m_pass=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, memberBean.getM_id());// 아이디=이메일
			pstmt.setString(2, memberBean.getM_pass());
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) { // 값이 있으면 1,
				insertCount = 1;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	// 회원정보 삭제(비즈니스 로직)를 수행하기 위한 deleteMember() 메서드 정의
	public int deleteMember(String m_id) {
		System.out.println("MemberDAO - deleteMember()");
		
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		
		String sql = "DELETE FROM member WHERE m_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	

}
