package vo;

import java.sql.Timestamp;

public class MemberBean {
	private String m_id;
	private String m_pass;
	private String m_name;
	private String m_phone;
	private String m_birth;
	private int m_gender;
	private int g_id;
	private String m_agree;
	private String m_address;
	private Timestamp m_rdate;
	private String m_drop;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pass() {
		return m_pass;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public int getM_gender() {
		return m_gender;
	}

	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getM_agree() {
		return m_agree;
	}

	public void setM_agree(String m_agree) {
		this.m_agree = m_agree;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public Timestamp getM_rdate() {
		return m_rdate;
	}

	public void setM_rdate(Timestamp m_rdate) {
		this.m_rdate = m_rdate;
	}

	public String getM_drop() {
		return m_drop;
	}

	public void setM_drop(String m_drop) {
		this.m_drop = m_drop;
	}

}
