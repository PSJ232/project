package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import vo.ClassBean;
import vo.ClassDetailBean;

import static db.JdbcUtil.*;

public class ClassDAO {
	
	private ClassDAO() {}
	private static ClassDAO instance;
	
	public static ClassDAO getInstance() {
		if(instance == null) {
			instance = new ClassDAO();
		}
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertClass(ClassBean classBean, String[] timeList) {
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
				num++;
			}
			close(pstmt);
			sql = "INSERT INTO fclass VALUES(?,?,?,?,?,?,0,?,?,?,?,now(),?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, classBean.getClass_subject());
			pstmt.setString(3, classBean.getClass_place());
			pstmt.setString(4, classBean.getClass_desc());
			pstmt.setInt(5, classBean.getClass_price());
			pstmt.setInt(6, classBean.getClass_max_member());
			pstmt.setString(7, classBean.getClass_main_img());
			pstmt.setString(8, classBean.getClass_sub_img1());
			pstmt.setString(9, classBean.getClass_sub_img2());
			pstmt.setString(10, classBean.getClass_sub_img3());
			pstmt.setString(11, classBean.getClass_date());
			pstmt.executeUpdate();
			 
			for(String time: timeList) {
				sql = "INSERT INTO fclass_detail VALUES(null,?,?,?,?,1)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, classBean.getClass_date());
				pstmt.setString(3, classBean.getClass_place());
				pstmt.setString(4, time);
				
				insertCount += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!(insertClass) - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return insertCount;
	}

	public ArrayList<ClassBean> getStartClassList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		try {
			String sql = "SELECT * FROM fclass WHERE date(f_cdate) > date(now()) ORDER BY f_subject, f_cdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassBean classBean = new ClassBean();
				classBean.setClass_id(rs.getInt("f_id"));
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_create_date(rs.getString("f_rdate"));
				classBean.setClass_date(rs.getString("f_cdate"));
				classBean.setClass_place(rs.getString("f_place"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classList.add(classBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}
	
	public ArrayList<ClassBean> getEndClassList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		try {
			String sql = "SELECT * FROM fclass WHERE date(f_cdate) < date(now()) ORDER BY f_subject, f_cdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassBean classBean = new ClassBean();
				classBean.setClass_id(rs.getInt("f_id"));
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_create_date(rs.getString("f_rdate"));
				classBean.setClass_date(rs.getString("f_cdate"));
				classBean.setClass_place(rs.getString("f_place"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classList.add(classBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}

	public ClassBean getDetailContent(int class_num) {
		ClassBean classBean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM fclass WHERE f_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, class_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				classBean = new ClassBean();
				classBean.setClass_id(class_num);
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_place(rs.getString("f_place"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_current_member(rs.getInt("f_curmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classBean.setClass_create_date(rs.getString("f_rdate"));
				classBean.setClass_date(rs.getString("f_cdate"));
				classBean.setClass_readcount(rs.getInt("f_readcount"));
				
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!(ClassDAO - getDetailContent) " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classBean;
	}

	public int modifyClass(ClassBean classBean, String[] timeList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int modifyCount = 0;
		try {
			String sql = "UPDATE fclass SET f_subject=?,f_desc=?,f_maxmem=?,f_main_img=?,f_sub_img1=?,f_sub_img2=?,f_sub_img3=? WHERE f_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, classBean.getClass_subject());
			pstmt.setString(2, classBean.getClass_desc());
			pstmt.setInt(3, classBean.getClass_max_member());
			pstmt.setString(4, classBean.getClass_main_img());
			pstmt.setString(5, classBean.getClass_sub_img1());
			pstmt.setString(6, classBean.getClass_sub_img2());
			pstmt.setString(7, classBean.getClass_sub_img3());
			pstmt.setInt(8, classBean.getClass_id());
			modifyCount = pstmt.executeUpdate();
			close(pstmt);
			if(timeList != null) {
				for(String time: timeList) {
					
					sql = "INSERT INTO fclass_detail VALUES(null,?,?,?,?,1)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, classBean.getClass_id());
					pstmt.setString(2, classBean.getClass_date());
					pstmt.setString(3, classBean.getClass_place());
					pstmt.setString(4, time);
					pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return modifyCount;
	}

	public int deleteClass(int class_num) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		try {
			String sql = "DELETE FROM fclass WHERE f_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, class_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류!(ClassDAO deleteClass) - " + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	public ArrayList<String> availableClassList(String f_subject) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> availableClassList = new ArrayList<String>();
		
		try {
			String sql = "SELECT f_place FROM fclass WHERE f_subject=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, f_subject);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				availableClassList.add(rs.getString("f_place"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return availableClassList;
	}

	public int getClassId(String f_place, String f_subject) {
		int f_id = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT f_id FROM fclass WHERE f_place=? and f_subject=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, f_place);
			pstmt.setString(2, f_subject);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				f_id = rs.getInt("f_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return f_id;
	}

	public int getMaxmem(int f_id) {
		int f_maxmem = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT f_maxmem FROM fclass WHERE f_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, f_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				f_maxmem = rs.getInt("f_maxmem");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return f_maxmem;
	}
	
	public ArrayList<ClassBean> getMypageStartClassList(String m_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		try {
			String sql = "SELECT * FROM fclass WHERE date(f_cdate) > date(now()) AND f_id=(select f_id from reservation where m_id=?) ORDER BY f_subject, f_cdate DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassBean classBean = new ClassBean();
				classBean.setClass_id(rs.getInt("f_id"));
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_create_date(rs.getString("f_rdate"));
				classBean.setClass_date(rs.getString("f_cdate"));
				classBean.setClass_place(rs.getString("f_place"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classList.add(classBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}

	public ArrayList<ClassBean> getMypageEndClassList(String m_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		try {
			String sql = "SELECT * FROM fclass WHERE date(f_cdate) > date(now()) AND f_id=(select f_id from reservation where m_id=?) ORDER BY f_subject, f_cdate DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassBean classBean = new ClassBean();
				classBean.setClass_id(rs.getInt("f_id"));
				classBean.setClass_subject(rs.getString("f_subject"));
				classBean.setClass_desc(rs.getString("f_desc"));
				classBean.setClass_price(rs.getInt("f_price"));
				classBean.setClass_max_member(rs.getInt("f_maxmem"));
				classBean.setClass_main_img(rs.getString("f_main_img"));
				classBean.setClass_create_date(rs.getString("f_rdate"));
				classBean.setClass_date(rs.getString("f_cdate"));
				classBean.setClass_place(rs.getString("f_place"));
				classBean.setClass_sub_img1(rs.getString("f_sub_img1"));
				classBean.setClass_sub_img2(rs.getString("f_sub_img2"));
				classBean.setClass_sub_img3(rs.getString("f_sub_img3"));
				classList.add(classBean);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문오류! - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}

	
}
