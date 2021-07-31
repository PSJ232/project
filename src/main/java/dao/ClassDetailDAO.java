package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import static db.JdbcUtil.*;
import vo.ClassDetailBean;

public class ClassDetailDAO {
	private ClassDetailDAO() {}
	private static ClassDetailDAO instance;
	
	public static ClassDetailDAO getInstance() {
		if(instance == null) {
			instance = new ClassDetailDAO();
		}
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
  
	public int insertClassDetail(ClassDetailBean classDetailBean, String[] timeList) {
		System.out.println("insertClassDetail");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		try {
			int num = 1;
			String sql = "SELECT MAX(f_id) FROM fclass";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
			close(pstmt);
			close(rs);
			
			for(String str: timeList) {
				sql = "INSERT INTO fclass_detail VALUES(null,?,?,?,?,1)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, classDetailBean.getDate());
				pstmt.setInt(2, num);
				pstmt.setString(3, classDetailBean.getPlace());
				pstmt.setString(4, str);
				
				insertCount += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류! - insertClassDetail" + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	public ArrayList<ClassDetailBean> getDetailList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassDetailBean> detailList = new ArrayList<ClassDetailBean>();
		try {
			String sql = "SELECT * FROM fclass_detail ORDER BY f_id DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassDetailBean classDetailBean = new ClassDetailBean();
				classDetailBean.setClass_detail_id(rs.getInt("fd_id"));
				classDetailBean.setClass_id(rs.getInt("f_id"));
				classDetailBean.setTime(rs.getInt("fd_time"));
				classDetailBean.setPlace(rs.getString("fd_place"));
				classDetailBean.setDate(rs.getString("fd_date"));
				detailList.add(classDetailBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			
		}
		return detailList;
	}
	
	public ArrayList<Time> getSelectableTimeList(String place, String date){
		System.out.println("ClassDetailDAO - getSelectableTimeList");
		ArrayList<Time> selectedTimeList = new ArrayList<Time>();
		ArrayList<Time> timeList = new ArrayList<Time>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT fd_time FROM fclass_detail WHERE fd_place=? and fd_date=? and fd_isselected=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, place);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				selectedTimeList.add(rs.getTime(1));
			}
			close(pstmt);
			close(rs);
			sql = "SELECT fcdt_time FROM fclass_detail_timelist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				timeList.add(rs.getTime(1));
			}
		}catch(SQLException e) {
			System.out.println("SQL구문오류! - " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		for(int j = 0; j < timeList.size(); j++) {
			for(int i = 0; i < selectedTimeList.size(); i++) {
				if(timeList.get(j).equals(selectedTimeList.get(i))) {
					timeList.remove(j);
				}
			}
		}
		return timeList;
	}
	
	public ArrayList<Time> getSelectedTimeList(int f_id) {
		ArrayList<Time> timeList = new ArrayList<Time>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT fd_time FROM fclass_detail WHERE f_id=? and fd_isselected=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, f_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				timeList.add(rs.getTime(1));
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return timeList;
	}
	
	//Detail 하나만 가져오기
		public ClassDetailBean getDetail(int fd_id){
			System.out.println("ClassDetailDAO - getDetail(int fd_id)");
			ClassDetailBean ClassDetail = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM fclass_detail where fd_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fd_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					ClassDetail = new ClassDetailBean();
					ClassDetail.setClass_detail_id(rs.getInt("fd_id"));
					ClassDetail.setClass_id(rs.getInt("f_id"));
					ClassDetail.setTime(rs.getInt("fd_time"));
					ClassDetail.setPlace(rs.getString("fd_place"));
					ClassDetail.setDate(rs.getString("fd_date"));
				}
			} catch (SQLException e) {
				System.out.println("SQL 구문 예외 getDetail() - " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
				
			}
			return ClassDetail;
		}

		//수강 가능 시간 조회
		public ArrayList<Integer> getTimeList(int f_id) {
			ArrayList<Integer> timeList = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT fd_time FROM fclass_detail WHERE f_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, f_id);
				rs = pstmt.executeQuery();
				timeList = new ArrayList<Integer>();
				while(rs.next()) {
					timeList.add(rs.getInt("fd_time"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return timeList;
		}

		public int getClassDetailId(ClassDetailBean cdb, String fd_time) {
			int fd_id = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT fd_id FROM fclass_detail WHERE fd_date = ? and fd_time = ? and fd_place =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cdb.getDate());
				pstmt.setString(2, fd_time);
				pstmt.setString(3, cdb.getPlace());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					fd_id = rs.getInt("fd_id");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return fd_id;
		}

	
}
