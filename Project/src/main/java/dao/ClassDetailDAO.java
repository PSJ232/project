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
			int num = 0;
			String sql = "SELECT MAX(f_id) FROM fclass";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
			for(String str: timeList) {
				System.out.println(num);
				System.out.println(classDetailBean.getPlace());
				System.out.println(classDetailBean.getDate());
				sql = "INSERT INTO fclass_detail VALUES(?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, classDetailBean.getDate());
				pstmt.setInt(2, num);
				pstmt.setString(3, classDetailBean.getPlace());
				pstmt.setString(4, str);
				pstmt.setInt(5, 1);
				
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
				classDetailBean.setClassNum(rs.getInt("f_id"));
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
	
	public ArrayList<Time> getTimeList(String place, String date){
		System.out.println("ClassDetailDAO - getTimeList");
		ArrayList<Time> selectedTimeList = new ArrayList<Time>();
		ArrayList<Time> timeList = new ArrayList<Time>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT fd_time FROM fclass_detail WHERE f_place=? and fd_date=? and fd_isselected=1";
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
	

	
}
