package vo;

public class PageInfo {
	private int page;
	private int listCount;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {}
	public PageInfo(int page, int listCount, int maxPage, int startPage, int endPage) {
		super();
		this.page = page;
		this.listCount = listCount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
}
