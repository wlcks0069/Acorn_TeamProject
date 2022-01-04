package pack.like_controller;

import java.util.Calendar;

public class LKBean {
	private int mc_no;
	private String mem_email, like_date;
	private String searchParam, searchValue;
	
	public String getSearchParam() {
		return searchParam;
	}

	public void setSearchParam(String searchParam) {
		this.searchParam = searchParam;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	public void setLike_date() {
	Calendar calender=Calendar.getInstance();
	int year=calender.get(Calendar.YEAR);
	int month=calender.get(Calendar.MONTH)+1;
	int day=calender.get(Calendar.DATE);
	this.like_date=year+"-"+month+"-"+day;
	}

	public int getMc_no() {
		return mc_no;
	}

	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getLike_date() {
		return like_date;
	}

	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
}
