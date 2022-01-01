package pack.cm_controller;

import java.util.Calendar;

public class CMBoardBean {
	private int cm_no, mc_no;
	private String mem_nick, mem_email, cm_commentcontent, cm_date;
	private String searchParam, searchValue;
	
	public void setCm_date() {
	Calendar calender=Calendar.getInstance();
	int year=calender.get(Calendar.YEAR);
	int month=calender.get(Calendar.MONTH)+1;
	int day=calender.get(Calendar.DATE);
	this.cm_date=year+"-"+month+"-"+day;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public int getMc_no() {
		return mc_no;
	}

	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getCm_commentcontent() {
		return cm_commentcontent;
	}

	public void setCm_commentcontent(String cm_commentcontent) {
		this.cm_commentcontent = cm_commentcontent;
	}

	public String getCm_date() {
		return cm_date;
	}

	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}

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

}
