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

	public int insertClassDetail(ClassDetailBean classDetailBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		return insertCount;
	}
	
	public ArrayList<Time> getTimeList(String place, String date){
		ArrayList<Time> selectedTimeList = new ArrayList<Time>();
		ArrayList<Time> timeList = new ArrayList<Time>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT fd_time FROM fclass_detail WHERE fd_place=? and fd_date=? and fd_is_selected=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, place);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				selectedTimeList.add(rs.getTime(1));
				System.out.println("rs.getTime(1): "+rs.getTime(1));
			}
			sql = "SELECT fcdt_time FROM fclass_detail_timelist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				timeList.add(rs.getTime(1));
			}
			System.out.println("selectedTimeList: "+selectedTimeList.toString());
			System.out.println("timeList: "+timeList.toString());
		}catch(SQLException e) {
			System.out.println("SQL구문오류! - " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		for(int j = 0; j < timeList.size(); j++) {
			for(int i = 0; i < selectedTimeList.size(); i++) {
				if(timeList.get(j).equals(selectedTimeList.get(i))) {
					System.out.println(timeList.get(j));
					timeList.remove(j);
				}
			}
		}
		return timeList;
	}
	
	
}
