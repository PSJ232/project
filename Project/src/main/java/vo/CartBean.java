package vo;

import java.sql.Date;

public class CartBean {
	private int c_id;
	private int i_id;
	private String m_id;
	private int c_qty;
	private Date c_rdate;
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public Date getC_rdate() {
		return c_rdate;
	}
	public void setC_rdate(Date c_rdate) {
		this.c_rdate = c_rdate;
	}
	
	
}
