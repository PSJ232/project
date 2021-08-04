package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.DetailBean;
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

	public int getCurrentNum(int fd_id) {
		int currentNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT SUM(r_num) FROM reservation WHERE fd_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fd_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				currentNum = rs.getInt("SUM(r_num)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return currentNum;
	}

	public ArrayList<ReservBean> getReservList(String m_id) {
		ArrayList<ReservBean> reservList = new ArrayList<ReservBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM reservation WHERE m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservBean rb = new ReservBean();
				rb.setF_id(rs.getInt("f_id"));
				rb.setFd_id(rs.getInt("fd_id"));
				rb.setM_id(rs.getString("m_id"));
				rb.setR_id(rs.getInt("r_id"));
				rb.setR_num(rs.getInt("r_num"));
				rb.setR_payment(rs.getString("r_payment"));
				rb.setR_date(rs.getString("r_date"));
				reservList.add(rb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reservList;
	}

	public ArrayList<ReservBean> getReservInfo(String place, String time, String date) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReservBean> resultList = new ArrayList<ReservBean>();
		try {
			String sql = "SELECT * FROM reservation r, fclass_detail fd WHERE r.fd_id=fd.fd_id AND fd_place=? AND fd_time=? AND fd_date=? ORDER BY r.r_date";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, place);
			pstmt.setString(2, time);
			pstmt.setString(3, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservBean reservBean = new ReservBean();
				reservBean.setR_id(rs.getInt("r_id"));
				reservBean.setM_id(rs.getString("m_id"));
				reservBean.setF_id(rs.getInt("f_id"));
				reservBean.setFd_id(rs.getInt("fd_id"));
				reservBean.setR_num(rs.getInt("r_num"));
				reservBean.setR_payment(rs.getString("r_payment"));
				reservBean.setR_date(rs.getString("r_date"));
				reservBean.setR_payment(rs.getString("r_payment"));
				reservBean.setR_amount(rs.getInt("r_amount"));
				resultList.add(reservBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!" + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return resultList;
	}

	public ArrayList<DetailBean> getMemberReservList(String m_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DetailBean> reservList = new ArrayList<DetailBean>();
		try {
			String sql = "SELECT r.r_id,fd.fd_time,fd.fd_place,r.r_num,r.r_payment,r.r_date,r.r_comfirm,r.r_amount,f.f_subject" +
						"FROM fclass f, fclass_detail fd, reservation r" + 
						"WHERE f.f_id=r.f_id AND fd.fd_id=r.fd_id AND r.m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DetailBean detailBean = new DetailBean();
				detailBean.setR_id(rs.getInt("r_id"));
				detailBean.setFd_time(rs.getString("fd_time"));
				detailBean.setFd_place(rs.getString("fd_place"));
				detailBean.setR_num(rs.getInt("r_num"));
				detailBean.setR_payment(rs.getString("r_payment"));
				detailBean.setR_date(rs.getString("r_date"));
				detailBean.setR_confirm(rs.getInt("r_confirm"));
				detailBean.setR_amount(rs.getInt("r_amount"));
				detailBean.setF_subject(rs.getString("f_subject"));
				reservList.add(detailBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!" + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return reservList;
	}
	
	
	

}
