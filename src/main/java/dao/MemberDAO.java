package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JdbcUtil;
import vo.AnniversaryBean;
import vo.MemberBean;
import vo.OrderBean;
import vo.ReviewBean;

// 실제 데이터베이스 작업(비즈니스 로직)을 수행하는 MemberDAO 클래스 정의
public class MemberDAO {

	private static MemberDAO instance;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		// 기존 MemberDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if (instance == null) {
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
			String sql = "INSERT INTO member(m_id,m_pass,m_name,m_phone,m_birth,m_gender,g_id,m_agree,m_rdate,m_point)"
					+ " VALUES(?,?,?,?,?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memberBean.getM_id());// 아이디=이메일
			pstmt.setString(2, memberBean.getM_pass());
			pstmt.setString(3, memberBean.getM_name());
			pstmt.setString(4, memberBean.getM_phone());
			pstmt.setString(5, memberBean.getM_birth());
			pstmt.setInt(6, memberBean.getM_gender());
			pstmt.setInt(7, 0);// 회원등급 기본값 0
			pstmt.setString(8, memberBean.getM_agree());// 동의:on, 비동의:null
			pstmt.setInt(9, 1000); // 가입시 지급포인트 1000,
			// 최근배송지 및 회원탈퇴는 초기값 null
			// 가입날짜는 자동입력

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;
	}

	// 로그인 작업(비즈니스 로직)을 수행하기 위한 userCheck() 메서드 정의
	public int userCheck(String m_id, String m_pass) {
		System.out.println("MemberDAO - userCheck()");

		int insertCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM member WHERE m_id=? and m_pass=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m_id);// 아이디=이메일
			pstmt.setString(2, m_pass);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 값이 있으면 1,
				insertCount = 1;
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return insertCount;
	}

	// 회원정보를 불러오는 (비즈니스 로직)를 수행하기 위한 getMember() 메서드 정의
	public MemberBean getMember(String m_id) {
		System.out.println("MemberDAO - getMember()");

		MemberBean memberDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM member WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);// 아이디=이메일
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberDetail = new MemberBean();
				memberDetail.setM_id(rs.getString("m_id"));
				memberDetail.setM_pass(rs.getString("m_pass"));
				memberDetail.setM_name(rs.getString("m_name"));
				memberDetail.setM_phone(rs.getString("m_phone"));
				memberDetail.setM_birth(rs.getString("m_birth"));
				memberDetail.setM_gender(rs.getInt("m_gender"));
				memberDetail.setG_id(rs.getInt("g_id"));
				memberDetail.setM_agree(rs.getString("m_agree"));
				memberDetail.setM_rdate(rs.getDate("m_rdate"));
				memberDetail.setM_drop(rs.getDate("m_drop"));
				memberDetail.setM_point(rs.getInt("m_point"));
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberDetail;
	}

	// 회원정보수정(비즈니스 로직)를 수행하기 위한 updateMember() 메서드 정의
	public int updateMember(MemberBean memberBean) {
		System.out.println("MemberDAO - updateMember()");
		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE member SET m_pass=?,m_name=?,m_phone=?,m_birth=?,m_gender=?,m_agree=? WHERE m_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memberBean.getM_pass());
			pstmt.setString(2, memberBean.getM_name());
			pstmt.setString(3, memberBean.getM_phone());
			pstmt.setString(4, memberBean.getM_birth());
			pstmt.setInt(5, memberBean.getM_gender());
			pstmt.setString(6, memberBean.getM_agree());
			pstmt.setString(7, memberBean.getM_id());

			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		return updateCount;
	}

	// 회원정보 삭제(비즈니스 로직)를 수행하기 위한 deleteMember() 메서드 정의
	public int deleteMember(String m_id, String m_pass) {
		System.out.println("MemberDAO - deleteMember()");

		PreparedStatement pstmt = null;
		int deleteCount = 0;

		String sql = "DELETE FROM member WHERE m_id=? AND m_pass=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pass);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		return deleteCount;
	}

	// 전화번호로 아이디 찾기
	public String findId(String m_phone) {
		System.out.println("MemberDAO - findId()");

		String myId = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT m_id FROM member WHERE m_phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				myId = rs.getString("m_id");
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return myId;
	}

	// 사용포인트 및 적립포인트를 pointSumService에서 계산하여 현재보유포인트 결과를 저장하는 메서드
	public int updatePoint(String m_id, int updatePoint) {
		System.out.println("MemberDAO - updatePoint()");

		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE member SET m_point=? WHERE m_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, updatePoint);
			pstmt.setString(2, m_id);

			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return updateCount;
	}

	public int insertAnn(AnniversaryBean anniversaryBean) {
		System.out.println("MemberDAO - insertAnn()");

		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO anniversary VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, anniversaryBean.getA_id());
			pstmt.setString(2, anniversaryBean.getM_id());
			pstmt.setString(3, anniversaryBean.getA_date());
			pstmt.setString(4, anniversaryBean.getA_name());
			pstmt.setInt(5, anniversaryBean.getA_repeat());

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;

	}

	public ArrayList<AnniversaryBean> selectAnnList(String m_id) {
		System.out.println("MemberDAO - selectAnnList()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		AnniversaryBean ab = null;
		ArrayList<AnniversaryBean> annList = new ArrayList<AnniversaryBean>();

		try {
			String sql = "SELECT * FROM anniversary WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ab = new AnniversaryBean();
				ab.setA_id(rs.getInt("a_id"));
				ab.setM_id(rs.getString("m_id"));
				ab.setA_date(rs.getString("a_date"));
				ab.setA_name(rs.getString("a_name"));
				ab.setA_repeat(rs.getInt("a_repeat"));
				annList.add(ab);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return annList;

	}

	public int deleteAnn(int a_id) {
		System.out.println("MemberDAO - deleteAnn()");

		PreparedStatement pstmt = null;
		int deleteCount = 0;

		String sql = "DELETE FROM anniversary WHERE a_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a_id);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		return deleteCount;
	}

	public int updateAnn(AnniversaryBean anniversaryBean) {
		System.out.println("MemberDAO - updateAnn()");

		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE anniversary SET a_date=?,a_name=?,a_repeat=? WHERE a_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, anniversaryBean.getA_date());
			pstmt.setString(2, anniversaryBean.getA_name());
			pstmt.setInt(3, anniversaryBean.getA_repeat());
			pstmt.setInt(4, anniversaryBean.getA_id());

			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return updateCount;
	}

	public AnniversaryBean selectAnn(int a_id) {
		System.out.println("MemberDAO - selectAnn()");
		AnniversaryBean annDetail = new AnniversaryBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM anniversary WHERE a_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				annDetail.setA_id(rs.getInt("a_id"));
				annDetail.setM_id(rs.getString("m_id"));
				annDetail.setA_date(rs.getString("a_date"));
				annDetail.setA_name(rs.getString("a_name"));
				annDetail.setA_repeat(rs.getInt("a_repeat"));
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return annDetail;
	}
	
	public ArrayList<MemberBean> search(String memberName, String filter, int page, int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberBean> resultList = new ArrayList<MemberBean>();
		int startRow = (page - 1) * limit;
		String sql = "";
		try {
			switch (filter) {
			case "1": sql = "SELECT * FROM member WHERE m_name LIKE ? ORDER BY m_drop desc, m_name LIMIT ?,?"; break;
			case "2": sql = "SELECT * FROM member WHERE m_id LIKE ? ORDER BY m_drop desc, m_id LIMIT ?,?"; break;
			case "3": sql = "SELECT * FROM member WHERE m_phone LIKE ? ORDER BY m_drop desc,m_phone LIMIT ?,?"; break;
			case "4": sql = "SELECT * FROM member WHERE m_phone LIKE ? ORDER BY m_drop desc,g_id LIMIT ?,?"; break;
			default: sql = "SELECT * FROM member WHERE m_name LIKE ? ORDER BY m_drop desc, m_id LIMIT ?,?";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + memberName + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setM_id(rs.getString("m_id"));
				mb.setM_name(rs.getString("m_name"));
				mb.setM_phone(rs.getString("m_phone"));
				mb.setM_birth(rs.getString("m_birth"));
				mb.setM_gender(rs.getInt("m_gender"));
				mb.setG_id(rs.getInt("g_id"));
				mb.setM_agree(rs.getString("m_agree"));
				mb.setM_rdate(rs.getDate("m_rdate"));
				mb.setM_drop(rs.getDate("m_drop"));
				mb.setM_point(rs.getInt("m_point"));
				resultList.add(mb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(MemberDAO - search(String memberName) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return resultList;
	}

	public MemberBean getMemberDetail(String m_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean memberBean = null;
		try {
			String sql = "SELECT * FROM member WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberBean = new MemberBean();
				memberBean.setM_id(m_id);
				memberBean.setM_name(rs.getString("m_name"));
				memberBean.setM_phone(rs.getString("m_phone"));
				memberBean.setM_birth(rs.getString("m_birth"));
				memberBean.setM_gender(rs.getInt("m_gender"));
				memberBean.setG_id(rs.getInt("g_id"));
				memberBean.setM_agree(rs.getString("m_agree"));
				memberBean.setM_rdate(rs.getDate("m_rdate"));
				memberBean.setM_drop(rs.getDate("m_drop"));
				memberBean.setM_point(rs.getInt("m_point"));
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류! (MemberDAO getMemberDetail) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberBean;
	}

	public float selectGradeDetail(int g_id) {
		System.out.println("MemberDAO - selectGradeDetail()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		float g_discount = 0.0f;
		try {
			String sql = "SELECT g_discount FROM grade WHERE g_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, g_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				g_discount = rs.getFloat("g_discount");
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return g_discount;
	}

	public ArrayList<ReviewBean> getMemberPointList(String m_id) {
		System.out.println("MemberDAO - getMemberPointList()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBean> pbList = new ArrayList<ReviewBean>();
		
		try {
			String sql = "SELECT r_point AS point, r_rdate AS date FROM review WHERE r_writer = ? " + "UNION "
					+ "SELECT o_point, o_rdate FROM orders WHERE m_id = ? " + "ORDER BY date DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean pb = new ReviewBean();
				pb.setR_point(rs.getInt(1));
				pb.setR_rdate(rs.getDate(2));
				pbList.add(pb);
			} 
			
		} catch (Exception e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return pbList;
	}

	public HashMap<String, Integer> getMemberData() {
		HashMap<String, Integer> memberData = new HashMap<String, Integer>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(m_gender) FROM member WHERE m_gender=0 and m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("남", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_gender) FROM member WHERE m_gender=1 and m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("여", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_birth) "
					+ "FROM member "
					+ "WHERE date(m_birth)>date(DATE_ADD(NOW(), INTERVAL -19 YEAR)) "
					+ "AND m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("10대이하", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_birth) "
					+ "FROM member "
					+ "WHERE date(m_birth)>date(DATE_ADD(NOW(), INTERVAL -29 YEAR)) "
					+ "AND date(m_birth)<date(DATE_ADD(NOW(), INTERVAL -19 YEAR)) "
					+ "AND m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("20대", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_birth) "
					+ "FROM member "
					+ "WHERE date(m_birth)>date(DATE_ADD(NOW(), INTERVAL -39 YEAR)) "
					+ "AND date(m_birth)<date(DATE_ADD(NOW(), INTERVAL -29 YEAR)) "
					+ "AND m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("30대", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_birth) "
					+ "FROM member "
					+ "WHERE date(m_birth)>date(DATE_ADD(NOW(), INTERVAL -49 YEAR)) "
					+ "AND date(m_birth)<date(DATE_ADD(NOW(), INTERVAL -39 YEAR)) "
					+ "AND m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("40대", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			sql = "SELECT COUNT(m_birth) "
					+ "FROM member "
					+ "WHERE date(m_birth)<date(DATE_ADD(NOW(), INTERVAL -49 YEAR)) "
					+ "AND m_drop IS NULL";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberData.put("50대이상", rs.getInt(1));
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!(MemberDAO  - getMemberData())" + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberData;
	}


	public ArrayList<Integer> getSubscribeCount(String m_id) {
		System.out.println("MemberDAO - getMemberPointList()");
		ArrayList<Integer> subscribeList = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT DISTINCT o_id FROM orders_detail WHERE m_id = ?"
					+ " AND od_confirm = 0 AND i_id IN (SELECT i_id FROM item WHERE i_category = 3)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int o_id = rs.getInt("o_id");
				subscribeList.add(o_id);
			} 
		} catch (Exception e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return subscribeList;
	}

	public int getListCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!(MemberDAO getListCount()) - " + e.getMessage());

		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return listCount;
	}

	
}
