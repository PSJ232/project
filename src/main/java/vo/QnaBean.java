package vo;

import java.sql.Date;

public class QnaBean {
	private int q_id;
	private int o_id;
	private String q_subject;
	private String q_content;
	private String q_img;
	private String q_img2;
	private String q_img3;
	private Date q_rdate;
	private String m_id;
	
	
	
	public String getQ_img2() {
		return q_img2;
	}
	public void setQ_img2(String q_img2) {
		this.q_img2 = q_img2;
	}
	public String getQ_img3() {
		return q_img3;
	}
	public void setQ_img3(String q_img3) {
		this.q_img3 = q_img3;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_img() {
		return q_img;
	}
	public void setQ_img(String q_img) {
		this.q_img = q_img;
	}
	public Date getQ_rdate() {
		return q_rdate;
	}
	public void setQ_rdate(Date q_rdate) {
		this.q_rdate = q_rdate;
	}
	
	
}
