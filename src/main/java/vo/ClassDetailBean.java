package vo;


public class ClassDetailBean {
	private int class_detail_id;
	private int time;
	private int class_id;
	private String date;
	private String place;
	private int isSelected;
	
	public int getClass_detail_id() {
		return class_detail_id;
	}
	public void setClass_detail_id(int class_detail_id) {
		this.class_detail_id = class_detail_id;
	}
	
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public int getIsSelected() {
		return isSelected;
	}
	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
}
