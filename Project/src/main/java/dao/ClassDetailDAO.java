package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		try {
			int num = 1;
			String sql = "SELECT MAX(f_id) FROM fclass";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
			sql = "INSERT INTO fclass_detail VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, classDetailBean.getStartTime());
			pstmt.setString(2, classDetailBean.getEndTime());
			pstmt.setString(3, classDetailBean.getPlace());
			pstmt.setInt(4, num);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문오류 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
}
