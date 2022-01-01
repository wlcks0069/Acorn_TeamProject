package pack.pp_controller;

import java.util.Calendar;

public class PPBean {
	private int pp_no,pp_likecount,pp_commentcount;
	private String mem_nick,mem_email,pp_colorlike,pp_brightnesslike;
	private String searchParam, searchValue;
	
	public int getPp_no() {
		return pp_no;
	}
	public void setPp_no(int pp_no) {
		this.pp_no = pp_no;
	}
	public int getPp_likecount() {
		return pp_likecount;
	}
	public void setPp_likecount(int pp_likecount) {
		this.pp_likecount = pp_likecount;
	}
	public int getPp_commentcount() {
		return pp_commentcount;
	}
	public void setPp_commentcount(int pp_commentcount) {
		this.pp_commentcount = pp_commentcount;
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
	public String getPp_colorlike() {
		return pp_colorlike;
	}
	public void setPp_colorlike(String pp_colorlike) {
		this.pp_colorlike = pp_colorlike;
	}
	public String getPp_brightnesslike() {
		return pp_brightnesslike;
	}
	public void setPp_brightnesslike(String pp_brightnesslike) {
		this.pp_brightnesslike = pp_brightnesslike;
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
