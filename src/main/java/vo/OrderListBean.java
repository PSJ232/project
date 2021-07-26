package vo;

public class OrderListBean {
	private String o_id;
	private String i_name;
	private String m_id;
	private int o_amount;
	private String o_rdate;
	private String od_invoice;
	
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getO_amount() {
		return o_amount;
	}
	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}
	public String getO_rdate() {
		return o_rdate;
	}
	public void setO_rdate(String o_rdate) {
		this.o_rdate = o_rdate;
	}
	public String getOd_invoice() {
		return od_invoice;
	}
	public void setOd_invoice(String od_invoice) {
		this.od_invoice = od_invoice;
	}
	
}
