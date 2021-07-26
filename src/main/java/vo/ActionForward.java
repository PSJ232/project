package vo;

public class ActionForward {
	// 포워딩할 주소(URL)와 포워딩 방식(Redirect or Dispatcher)을 저장하는 객체
	private String path;
	private boolean isRedirect;// 리다이렉트 방식일 경우 true, 디스패쳐 방식일 경우 false
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
