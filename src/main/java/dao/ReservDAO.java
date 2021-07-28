package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static db.JdbcUtil.*;

import vo.ReservBean;

public class ReservDAO {
	
	private static ReservDAO instance;
	
	private ReservDAO() {}
	
	public static ReservDAO getInstance() {
		// 기존 BoardDAO 인스턴스가 생성된 적이 없을 경우 인스턴스 생성 후 리턴
		if(instance == null) {
			instance = new ReservDAO();
		}
		
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 외부의 Service 클래스로부터 Connection 객체를 전달받아 Connection 타입 변수에 저장
	Connection con;// 멤버변수 Connection 타입 선언
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertReserv(ReservBean rb) {
		System.out.println("ReservDAO - insertReserv(rb)");
		int insertCount = 0;
		int max_rid = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql;
		try {
			sql = "SELECT MAX(r_id) from reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max_rid = rs.getInt("MAX(r_id)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		max_rid++;
		
		try {
			sql = "INSERT INTO reservation VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, max_rid);
			pstmt.setString(2, rb.getM_id());
			pstmt.setInt(3, rb.getF_id());
			pstmt.setInt(4, rb.getFd_id());
			pstmt.setInt(5, rb.getR_num());
			pstmt.setString(6, rb.getR_payment());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 예외 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int getrId(ReservBean rb) {
		int r_id = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT r_id FROM reservation where m_id=? and f_id=? and fd_id=? and r_num=? and r_payment=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rb.getM_id());
			pstmt.setInt(2, rb.getF_id());
			pstmt.setInt(3, rb.getFd_id());
			pstmt.setInt(4, rb.getR_num());
			pstmt.setString(5, rb.getR_payment());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				r_id = rs.getInt("r_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return r_id;
	}

	public int deleteReserv(int r_id) {
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM reservation WHERE r_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return deleteCount;
	}


	
	

}
