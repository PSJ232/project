package vo;

import java.sql.Date;

public class ReviewBean {
	private int r_id;
	private int od_id;
	private String r_writer;
	private String r_title;
	private String r_content;
	private int r_rate;
	private Date r_date;
	private String r_img;
	private int r_point;
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getOd_id() {
		return od_id;
	}
	public void setOd_id(int od_id) {
		this.od_id = od_id;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_rate() {
		return r_rate;
	}
	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getR_img() {
		return r_img;
	}
	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
	public int getR_point() {
		return r_point;
	}
	public void setR_point(int r_point) {
		this.r_point = r_point;
	}
	
	
}
