package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JdbcUtil;
import vo.ItemBean;
import vo.OrderBean;
import vo.OrderDetailBean;
import vo.DetailBean;

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
			String sql = "INSERT INTO orders VALUES(?,?,?,?,?,?,?,?,?,now(),?,?)";

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
			pstmt.setString(11, orderBean.getO_visitor());
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
				orderBean.setO_visitor(rs.getString("o_visitor"));

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

	public ArrayList<DetailBean> search(String search_val, String filter, int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startRow = (page - 1) * limit;
		ArrayList<DetailBean> resultList = new ArrayList<DetailBean>();
		String sql = "";
		try {
			switch (filter) {
			case "1":
				sql = "SELECT o.o_id,od.od_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT(' 외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice,od.od_confirm "
						+ "FROM orders o, orders_detail od, item i "
						+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? " + "GROUP BY o_id LIMIT ?,?";
				break;
			case "2":
				sql = "SELECT o.o_id,od.od_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT(' 외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice,od.od_confirm "
						+ "FROM orders o, orders_detail od, item i "
						+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and o.o_rdate like ? " + "GROUP BY o_id LIMIT ?,?";
				break;
			case "3":
				sql = "SELECT o.o_id,od.od_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT(' 외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice,od.od_confirm "
						+ "FROM orders o, orders_detail od, item i "
						+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? " + "GROUP BY o_id LIMIT ?,?";
				break;
			default:
				sql = "SELECT o.o_id,od.od_id,CONCAT(i.i_name,IF(COUNT(od.i_id)>1,CONCAT(' 외',CONCAT(COUNT(od.i_id)-1,'건')),'')),od.m_id,o.o_amount,o.o_rdate,od.od_invoice,od.od_confirm "
						+ "FROM orders o, orders_detail od, item i "
						+ "WHERE o.o_id=od.o_id and od.i_id=i.i_id and od.m_id like ? " + "GROUP BY o_id LIMIT ?,?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search_val + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DetailBean olb = new DetailBean();
				olb.setO_id(rs.getString("o_id"));
				olb.setOd_id(rs.getString("od_id"));
				olb.setI_name(rs.getString(3));
				olb.setM_id(rs.getString("m_id"));
				olb.setO_amount(rs.getInt("o_amount"));
				olb.setO_rdate(rs.getString("o_rdate"));
				olb.setOd_invoice(rs.getString("od_invoice"));
				olb.setOd_confirm(rs.getInt("od_confirm"));
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

	public OrderBean getOrder(String o_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderBean orderBean = null;
		try {
			String sql = "SELECT * FROM orders WHERE o_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				orderBean = new OrderBean();
				orderBean.setO_id(rs.getInt("o_id"));
				orderBean.setO_sender(rs.getString("o_sender"));
				orderBean.setO_address(rs.getString("o_address"));
				orderBean.setO_receiver(rs.getString("o_receiver"));
				orderBean.setO_phone(rs.getString("o_phone"));
				orderBean.setO_amount(rs.getInt("o_amount"));
				orderBean.setO_payment(rs.getInt("o_payment"));
				orderBean.setO_rdate(rs.getDate("o_rdate"));
				orderBean.setO_rdate2(rs.getTimestamp("o_rdate"));
				orderBean.setO_gdiscount(rs.getInt("o_gdiscount"));
				orderBean.setO_visitor(rs.getString("o_visitor"));
				orderBean.setO_point(rs.getInt("o_point"));
				orderBean.setM_id(rs.getString("m_id"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - getOrder(String o_id) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderBean;
	}

	public ArrayList<OrderDetailBean> getOrderDetail(String o_id) {
		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT od.od_id,od.o_id,i.i_id,od.l_id,od.od_qty,od.od_message,od.m_id,od.od_delivery_date,od.od_invoice,od.od_confirm,i.i_name"
					+ " FROM orders_detail od, item i "
					+ "WHERE i.i_id=od.i_id and o_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setOd_id(rs.getInt("od_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setM_id(rs.getString("m_id"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				if(rs.getString("od_invoice").equals("주문접수")) {
					odb.setOd_invoice("운송장을 입력해주세요");
				}else {
					odb.setOd_invoice(rs.getString("od_invoice"));
				}
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setI_name(rs.getString("i_name"));
				orderDetailList.add(odb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - getOrderDetail(String o_id) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderDetailList;
	}
	
	public ArrayList<OrderDetailBean> getMypageOrderDetail(String o_id) {
		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT od.* FROM orders_detail od, item i WHERE i.i_id=od.i_id and o_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setOd_id(rs.getInt("od_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_review(rs.getInt("od_review"));
				odb.setM_id(rs.getString("m_id"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				orderDetailList.add(odb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - getOrderDetail(String o_id) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderDetailList;
	}

	// Order
	public ArrayList<OrderBean> getOrderNonStatusOrderList(String m_id) {
		System.out.println("OrderDAO - getOrderNonStatusOrderList()");

		ArrayList<OrderBean> nonOrderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT o.* FROM orders_detail od JOIN orders o ON od.o_id = o.o_id JOIN item i ON i.i_id = od.i_id"
				+ " WHERE i.i_category!=3 AND od.m_id =? AND (od.od_confirm = 0 OR od.od_confirm= 1)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				nonOrderArrayList.add(ob);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderNonStatusOrderList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nonOrderArrayList;
	}
	
	public ArrayList<OrderBean> getSubscribeNonStatusOrderList(String m_id) {
		System.out.println("OrderDAO - getSubscribeNonStatusOrderList()");
		
		ArrayList<OrderBean> nonOrderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o.* FROM orders_detail od JOIN orders o ON od.o_id = o.o_id JOIN item i ON i.i_id = od.i_id"
				+ " WHERE i.i_category=3 AND od.m_id =? AND (od.od_confirm = 0 OR od.od_confirm= 1)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				nonOrderArrayList.add(ob);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeNonStatusOrderList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nonOrderArrayList;
	}

	public ArrayList<OrderBean> getOrderStatusOrderList(String m_id) {
		System.out.println("OrderDAO - getOrderStatusOrderList()");

		ArrayList<OrderBean> orderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT o.* FROM orders_detail od JOIN orders o ON od.o_id = o.o_id JOIN item i ON i.i_id = od.i_id "
				+ "WHERE i.i_category!=3 AND od.od_confirm = 2 AND od.m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				orderArrayList.add(ob);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderStatusOrderList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orderArrayList;
	}
	
	public ArrayList<OrderBean> getSubscribeStatusOrderList(String m_id) {
		System.out.println("OrderDAO - getOrderStatusOrderList()");
		
		ArrayList<OrderBean> orderArrayList = new ArrayList<OrderBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT o.* FROM orders_detail od JOIN orders o ON od.o_id = o.o_id JOIN item i ON i.i_id = od.i_id "
				+ "WHERE i.i_category=3 AND od.od_confirm = 2 AND od.m_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setO_id(rs.getInt("o_id"));
				ob.setO_rdate(rs.getDate("o_rdate"));
				ob.setO_receiver(rs.getString("o_receiver"));
				ob.setO_amount(rs.getInt("o_amount"));
				ob.setO_address(rs.getString("o_address"));
				ob.setO_gdiscount(rs.getInt("o_gdiscount"));
				ob.setO_payment(rs.getInt("o_payment"));
				ob.setO_phone(rs.getString("o_phone"));
				ob.setO_point(rs.getInt("o_point"));
				ob.setO_sender(rs.getString("o_sender"));
				orderArrayList.add(ob);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeStatusOrderList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orderArrayList;
	}

	// Item
	public ArrayList<ItemBean> getOrderNonStatusItemList(String m_id) {
		System.out.println("OrderDAO - getOrderNonStatusItemList()");

		ArrayList<ItemBean> nonItemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT i.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE i.i_category !=3 AND od.m_id = ? AND (od.od_confirm = 0 OR od.od_confirm = 1)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				nonItemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderNonStatusItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nonItemArrayList;
	}

	public ArrayList<ItemBean> getSubscribeNonStatusItemList(String m_id) {
		System.out.println("OrderDAO - getOrderNonStatusItemList()");
		
		ArrayList<ItemBean> nonItemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE i.i_category =3 AND od.m_id = ? AND (od.od_confirm = 0 OR od.od_confirm = 1)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				nonItemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeNonStatusItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nonItemArrayList;
	}

	public ArrayList<ItemBean> getOrderStatusItemList(String m_id) {
		System.out.println("OrderDAO - getOrderStatusItemList()");

		ArrayList<ItemBean> itemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT i.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE i.i_category !=3 AND od.m_id = ? AND od.od_confirm = 2";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				itemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderNonStatusItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return itemArrayList;
	}

	public ArrayList<ItemBean> getSubscribeStatusItemList(String m_id) {
		System.out.println("OrderDAO - getOrderStatusItemList()");
		
		ArrayList<ItemBean> itemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT i.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE i.i_category =3 AND od.m_id = ? AND od.od_confirm = 2;";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				itemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeNonStatusItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return itemArrayList;
	}

	// OrderDetail
	public ArrayList<OrderDetailBean> getOrderNonStatusOrderDetailList(String m_id) {
		System.out.println("OrderDAO - getOrderNonStatusOrderDetailList");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT od.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE m_id = ? AND i.i_category != 3 AND (od_confirm = 0 OR od_confirm = 1)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				nonOrderDetailArrayList.add(odb);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderNonStatusOrderDetailList SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> getSubscribeNonStatusOrderDetailList(String m_id) {
		System.out.println("OrderDAO - getSubscribeNonStatusOrderDetailList");
		ArrayList<OrderDetailBean> nonOrderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT od.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE m_id = ? AND i.i_category = 3 AND (od_confirm = 0 OR od_confirm = 1)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				nonOrderDetailArrayList.add(odb);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeNonStatusOrderDetailList SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return nonOrderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> getOrderStatusOrderDetailList(String m_id) {
		System.out.println("OrderDAO - getOrderStatusOrderDetailList");
		ArrayList<OrderDetailBean> orderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT od.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE m_id = ? AND i.i_category != 3 AND od_confirm = 2;";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				orderDetailArrayList.add(odb);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getOrderStatusOrderDetailList SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orderDetailArrayList;
	}

	public ArrayList<OrderDetailBean> getSubscribeStatusOrderDetailList(String m_id) {
		System.out.println("OrderDAO - getSubscribeStatusOrderDetailList");
		ArrayList<OrderDetailBean> orderDetailArrayList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT od.* FROM orders_detail od JOIN item i ON od.i_id = i.i_id "
				+ "WHERE m_id = ? AND i.i_category = 3 AND od_confirm = 2";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setC_id(rs.getInt("c_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setM_id(rs.getString("m_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_id(rs.getInt("od_id"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_review(rs.getInt("od_review"));
				orderDetailArrayList.add(odb);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getSubscribeStatusOrderDetailList SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orderDetailArrayList;
	}
	
	public int updateOrderConfirm(int o_id, int num) {
		System.out.println("OrderDAO - updateOrderConfirm");
		PreparedStatement pstmt = null;

		String sql = "UPDATE orders_detail SET od_confirm=? WHERE o_id=?";
		int updateCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, o_id);
			updateCount = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		return updateCount;
	}

	public ArrayList<OrderDetailBean> getOrderDetailList(String m_id) {
		System.out.println("OrderDAO - getOrderDetailList()");
		ArrayList<OrderDetailBean> orderDetailList = new ArrayList<OrderDetailBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM orders_detail WHERE m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDetailBean odb = new OrderDetailBean();
				odb.setOd_id(rs.getInt("od_id"));
				odb.setO_id(rs.getInt("o_id"));
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_review(rs.getInt("od_review"));
				odb.setM_id(rs.getString("m_id"));
				odb.setC_id(rs.getInt("c_id"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
				orderDetailList.add(odb);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return orderDetailList;
	}

	public ArrayList<ItemBean> getItemList(String o_id) {
		System.out.println("OrderDAO - getItemList()");

		ArrayList<ItemBean> itemArrayList = new ArrayList<ItemBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT i.* FROM item i JOIN orders_detail od ON i.i_id = od.i_id WHERE od.o_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean ib = new ItemBean();
				ib.setI_id(rs.getInt("i_id"));
				ib.setI_name(rs.getString("i_name"));
				ib.setI_desc(rs.getString("i_desc"));
				ib.setI_price(rs.getInt("i_price"));
				ib.setI_inven(rs.getInt("i_inven"));
				ib.setI_img(rs.getString("i_img"));
				ib.setI_subimg2(rs.getString("i_subimg2"));
				ib.setI_subimg3(rs.getString("i_subimg3"));
				ib.setI_subimg4(rs.getString("i_subimg4"));
				ib.setI_rdate(rs.getTimestamp("i_rdate"));
				ib.setI_discount(rs.getFloat("i_discount"));
				ib.setI_size(rs.getString("i_size"));
				ib.setI_dpstatus(rs.getString("i_dpstatus"));
				ib.setI_itemstatus(rs.getString("i_itemstatus"));
				ib.setI_detailpage(rs.getString("i_detailpage"));
				ib.setI_category(rs.getInt("i_category"));
				itemArrayList.add(ib);
			}
		} catch (Exception e) {
			System.out.println("OrderDAO - getItemList() SQL문 오류 - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return itemArrayList;
	}
	
	public HashMap<String, Integer> getOrderCount(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String, Integer> orderCount = new HashMap<String, Integer>();
		try {
			String sql = "SELECT COUNT(od_id) FROM orders_detail WHERE od_invoice='주문접수'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderCount.put("주문접수", rs.getInt(1));
			}
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
			sql = "SELECT COUNT(od_id) FROM orders_detail WHERE NOT od_invoice='주문접수' AND od_confirm=0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderCount.put("배송중", rs.getInt(1));
			}
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
			
			sql = "SELECT COUNT(od_id) FROM orders_detail WHERE NOT od_invoice='주문접수' AND od_confirm=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderCount.put("배송완료", rs.getInt(1));
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류!(orderDAO getOrderCount()) - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orderCount;
	}

	// 비회원 주문내역 확인 기능
	public OrderBean selectVistorOrder(String o_sender, int o_id) {
		System.out.println("OrderDAO - selectVistorOrder()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderBean orderBean = null;
		try {
			String sql = "SELECT * FROM orders WHERE o_sender=? AND o_id=? AND m_id='visitor'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o_sender);
			pstmt.setInt(2, o_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				orderBean = new OrderBean();
				orderBean.setO_id(o_id);
				orderBean.setM_id(rs.getString("m_id"));
				orderBean.setO_sender(o_sender);
				orderBean.setO_address(rs.getString("o_address"));
				orderBean.setO_receiver(rs.getString("o_receiver"));
				orderBean.setO_phone(rs.getString("o_phone"));
				orderBean.setO_amount(rs.getInt("o_amount"));
				orderBean.setO_payment(rs.getInt("o_payment"));
				orderBean.setO_rdate(rs.getDate("o_rdate"));
				orderBean.setO_rdate2(rs.getTimestamp("o_rdate"));
				orderBean.setO_gdiscount(rs.getInt("o_gdiscount"));
				orderBean.setO_visitor(rs.getString("o_visitor"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderBean;
	}

	public OrderDetailBean getOrderDetailList(int o_id) {
		System.out.println("OrderDAO - getOrderDetailList()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderDetailBean odb = null;
		try {
			String sql = "SELECT * FROM orders_detail WHERE o_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				odb = new OrderDetailBean();
				odb.setOd_id(rs.getInt("od_id"));
				odb.setO_id(o_id);
				odb.setI_id(rs.getInt("i_id"));
				odb.setL_id(rs.getInt("l_id"));
				odb.setOd_qty(rs.getInt("od_qty"));
				odb.setOd_message(rs.getString("od_message"));
				odb.setOd_review(rs.getInt("od_review"));
				odb.setM_id(rs.getString("m_id"));
				odb.setC_id(rs.getInt("c_id"));
				odb.setOd_delivery_date(rs.getString("od_delivery_date"));
				odb.setOd_invoice(rs.getString("od_invoice"));
				odb.setOd_confirm(rs.getInt("od_confirm"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return odb;
	}

	public int InsertTrackingNum(int od_id, String trackingNum) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		try {
			String sql = "UPDATE orders_detail SET od_invoice=? WHERE od_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, trackingNum);
			pstmt.setInt(2, od_id);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!(OrderDAO InsertTrackingNum) - " + e.getMessage());
		}finally {
			JdbcUtil.close(pstmt);
		}
		return insertCount;
	}

	public int getListCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM orders";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생!(OrderDAO getListCount()) - " + e.getMessage());

		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return listCount;
	}
	
	public HashMap<String, Integer> getSalesInfo() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String, Integer> salesInfo = new HashMap<String, Integer>();
		try {
			String sql = "SELECT SUM(result) "
					+ "FROM (SELECT SUM(o_amount) result "
					+ "FROM orders "
					+ "WHERE o_payment=1 "
					+ "UNION ALL "
					+ "SELECT SUM(r_amount) result "
					+ "FROM reservation "
					+ "WHERE r_payment='카드') AS re";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("카드매출", rs.getInt(1));
			}
			close(rs);
			close(pstmt);
			sql = "SELECT SUM(result) "
				+ "FROM (SELECT SUM(o_amount) result "
				+ "FROM orders "
				+ "WHERE o_payment=0 "
				+ "UNION ALL "
				+ "SELECT SUM(r_amount) result "
				+ "FROM reservation "
				+ "WHERE r_payment='현금') AS re";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("현금매출", rs.getInt(1));
			}
			close(rs);
			close(pstmt);
			sql = "SELECT SUM(result) "
				+ "FROM (SELECT SUM(o_amount) result "
				+ "FROM orders "
				+ "UNION ALL "
				+ "SELECT SUM(r_amount) result "
				+ "FROM reservation) AS re";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				salesInfo.put("총매출", rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return salesInfo;
	}
	

	public HashMap<String, Integer> getWeekCardSales() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String,Integer> weekCardSales = new HashMap<String, Integer>();
		try {
			String sql = "SELECT COALESCE(odate, rdate) date, IFNULL(oamount,0)+IFNULL(ramount,0) card "
					+ "FROM ("
					+ "	SELECT DATE_FORMAT(o_rdate,'%m%d') odate, SUM(o_amount) oamount"
					+ "	FROM orders"
					+ "	WHERE o_payment=1"
					+ "	GROUP BY DATE_FORMAT(o_rdate,'%m%d')"
					+ "	) "
					+ "AS o "
					+ "LEFT OUTER JOIN ("
					+ "	SELECT DATE_FORMAT(r_date,'%m%d') rdate, SUM(r_amount) ramount"
					+ "	FROM reservation"
					+ "	WHERE r_payment='현금'"
					+ "	GROUP BY DATE_FORMAT(r_date,'%m%d')"
					+ "	) "
					+ "AS r "
					+ "ON o.odate=r.rdate "
					+ "UNION "
					+ "SELECT COALESCE(odate, rdate) date, IFNULL(oamount,0)+IFNULL(ramount,0) card "
					+ "FROM ("
					+ "	SELECT DATE_FORMAT(o_rdate,'%m%d') odate, SUM(o_amount) oamount"
					+ "	FROM orders"
					+ "	WHERE o_payment=0"
					+ "	GROUP BY DATE_FORMAT(o_rdate,'%m%d')"
					+ "	) "
					+ "AS o "
					+ "RIGHT OUTER JOIN ("
					+ "	SELECT DATE_FORMAT(r_date,'%m%d') rdate, SUM(r_amount) ramount"
					+ "	FROM reservation"
					+ "	WHERE r_payment='카드'"
					+ "	GROUP BY DATE_FORMAT(r_date,'%m%d')"
					+ "	) "
					+ "AS r "
					+ "ON o.odate=r.rdate "
					+ "GROUP BY date LIMIT 7";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				weekCardSales.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return weekCardSales;
	}
	public HashMap<String, Integer> getWeekCashSales() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String,Integer> weekCardSales = new HashMap<String, Integer>();
		try {
			String sql = "SELECT COALESCE(odate, rdate) date, IFNULL(oamount,0)+IFNULL(ramount,0) cash "
					+ "FROM ("
					+ "	SELECT DATE_FORMAT(o_rdate,'%m%d') odate, SUM(o_amount) oamount"
					+ "	FROM orders"
					+ "	WHERE o_payment=0"
					+ "	GROUP BY DATE_FORMAT(o_rdate,'%m%d')"
					+ "	) "
					+ "AS o "
					+ "LEFT OUTER JOIN ("
					+ "	SELECT DATE_FORMAT(r_date,'%m%d') rdate, SUM(r_amount) ramount"
					+ "	FROM reservation"
					+ "	WHERE r_payment='현금'"
					+ "	GROUP BY DATE_FORMAT(r_date,'%m%d')"
					+ "	) "
					+ "AS r "
					+ "ON o.odate=r.rdate "
					+ "UNION "
					+ "SELECT COALESCE(odate, rdate) date, IFNULL(oamount,0)+IFNULL(ramount,0) cash "
					+ "FROM ("
					+ "	SELECT DATE_FORMAT(o_rdate,'%m%d') odate, SUM(o_amount) oamount"
					+ "	FROM orders"
					+ "	WHERE o_payment=0"
					+ "	GROUP BY DATE_FORMAT(o_rdate,'%m%d')"
					+ "	) "
					+ "AS o "
					+ "RIGHT OUTER JOIN ("
					+ "	SELECT DATE_FORMAT(r_date,'%m%d') rdate, SUM(r_amount) ramount"
					+ "	FROM reservation"
					+ "	WHERE r_payment='현금'"
					+ "	GROUP BY DATE_FORMAT(r_date,'%m%d')"
					+ "	) "
					+ "AS r "
					+ "ON o.odate=r.rdate "
					+ "GROUP BY date LIMIT 7";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				weekCardSales.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return weekCardSales;
	}

	public int updatePurchaseConfirm(int od_id) {
		System.out.println("OrderDAO - updatePurchaseConfirm");
		PreparedStatement pstmt = null;

		String sql = "UPDATE orders_detail SET od_confirm=1 WHERE od_id=?";
		int updateCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, od_id);
			updateCount = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("SQL 구문 오류 발생! - " + e.getMessage());
		} finally {
			JdbcUtil.close(pstmt);
		}
		return updateCount;
	}

	public int checkInven(int i_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int nowInven = 0;
		try {
			String sql = "SELECT * FROM item WHERE i_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, i_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				nowInven = rs.getInt("i_inven");
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류!(OrderDAO - getOrder(String o_id) - " + e.getMessage());
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return nowInven;
	}

}