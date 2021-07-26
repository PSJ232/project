package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.OrderBean;
import vo.OrderDetailBean;
import vo.OrderListBean;

public class OrderDAO {

	private static OrderDAO instance;

	private OrderDAO() {
	}

	public static OrderDAO getInstance() {
		if (instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertOrder(OrderBean orderBean) {
		System.out.println("OrderDAO - insertOrder()");

		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO orders VALUES(?,?,?,?,?,?,?,?,?,now(),?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, orderBean.getO_id());
			pstmt.setString(2, orderBean.getM_id());
			pstmt.setString(3, orderBean.getO_sender());
			pstmt.setString(4, orderBean.getO_address());
			pstmt.setString(5, orderBean.getO_receiver());
			pstmt.setString(6, orderBean.getO_phone());
			pstmt.setInt(7, orderBean.getO_amount());
			pstmt.setInt(8, orderBean.getO_point());
			pstmt.setInt(9, orderBean.getO_payment());
			pstmt.setInt(10, orderBean.getO_gdiscount());
			// rdate는 sql구문에 바로 now()


			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;
	}

	// 각 테이블의 고유ID번호 MAX() 불러오는 메서드 정의
	public int makeId(String table, String colName) {
		System.out.println("OrderDAO - makeId()");
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT MAX(" + colName + ") FROM " + table;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxNum = rs.getInt("MAX(" + colName + ")");
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return maxNum; // 최대번호만 추출하여 리턴하고 IdMakerService에서 id 조합 작업실시
	}

	public int insertOrderDetail(OrderDetailBean orderDetailBean) {
		System.out.println("OrderDAO - insertOrderDetail()");

		int insertCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO orders_detail VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, orderDetailBean.getOd_id());
			pstmt.setInt(2, orderDetailBean.getO_id());
			pstmt.setInt(3, orderDetailBean.getI_id());
			pstmt.setInt(4, orderDetailBean.getL_id());
			pstmt.setInt(5, orderDetailBean.getOd_qty());
			pstmt.setString(6, orderDetailBean.getOd_message());
			pstmt.setInt(7, 0); // 리뷰 기본값 0:(미작성)
			pstmt.setString(8, orderDetailBean.getM_id());
			pstmt.setInt(9, orderDetailBean.getC_id());
			pstmt.setString(10, orderDetailBean.getOd_delivery_date());
			pstmt.setString(11, "주문접수"); // 배송상태 기본값 주문접수
			pstmt.setInt(12, 0); // 구매확정 기본값 0

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}

		return insertCount;

	}

	public ArrayList<OrderBean> selectOrderList(String m_id) {
		System.out.println("OrderDAO - selectOrderList()");

		ArrayList<OrderBean> orderList = null;
		OrderBean orderBean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM orders WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			orderList = new ArrayList<OrderBean>();

			while (rs.next()) {
				orderBean = new OrderBean();
				orderBean.setO_id(rs.getInt("o_id"));
				orderBean.setM_id(m_id);
				orderBean.setO_sender(rs.getString("o_sender"));
				orderBean.setO_address(rs.getString("o_address"));
				orderBean.setO_receiver(rs.getString("o_receiver"));
				orderBean.setO_phone(rs.getString("o_phone"));
				orderBean.setO_amount(rs.getInt("o_amount"));
				orderBean.setO_point(rs.getInt("o_point"));
				orderBean.setO_payment(rs.getInt("o_payment"));
				orderBean.setO_rdate(rs.getDate("o_rdate"));
				orderBean.setO_gdiscount(rs.getInt("o_gdiscount"));

				orderList.add(orderBean);
			}

		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return orderList;

	}
	public ArrayList<OrderListBean> search(String search_val, String filter) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderListBean> resultList = new ArrayList<OrderListBean>();
		String sql = "";
		try {
			switch (filter) {
			case "1": sql = "SELECT o.o_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT('외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice "
					+ "FROM orders o, orders_detail od, item i "
					+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? "
					+ "GROUP BY o_id";
					break;
			case "2": sql = "SELECT o.o_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT('외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice "
					+ "FROM orders o, orders_detail od, item i "
					+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and o.o_rdate like ? "
					+ "GROUP BY o_id";
					break;
			case "3": sql = "SELECT o.o_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT('외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice "
					+ "FROM orders o, orders_detail od, item i "
					+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? "
					+ "GROUP BY o_id";
					break;
			default: sql = "SELECT o.o_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT('외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice "
					+ "FROM orders o, orders_detail od, item i "
					+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? "
					+ "GROUP BY o_id";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search_val + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderListBean olb = new OrderListBean();
				olb.setO_id(rs.getString("o_id"));
				olb.setI_name(rs.getString(2));
				olb.setM_id(rs.getString("m_id"));
				olb.setO_amount(rs.getInt("o_amount"));
				olb.setO_rdate(rs.getString("o_rdate"));
				olb.setOd_invoice(rs.getString("od_invoice"));
				resultList.add(olb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - search(String m_id, String filter) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return resultList;
	}

	public ArrayList<OrderListBean> getOrderList(String m_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderListBean> orderList = new ArrayList<OrderListBean>();
		try {
			String sql = "SELECT o.o_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT('외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice "
					+ "FROM orders o, orders_detail od, item i "
					+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? "
					+ "GROUP BY o_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderListBean olb = new OrderListBean();
				olb.setO_id(rs.getString("o_id"));
				olb.setI_name(rs.getString(2));
				olb.setM_id(rs.getString("m_id"));
				olb.setO_amount(rs.getInt("o_amount"));
				olb.setO_rdate(rs.getString("o_rdate"));
				olb.setOd_invoice(rs.getString("od_invoice"));
				orderList.add(olb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - getOrderList(String m_id) - " + e.getMessage());
		}
		return orderList;
	}
}
