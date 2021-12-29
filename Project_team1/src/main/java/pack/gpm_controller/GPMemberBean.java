package pack.gpm_controller;

import java.util.Calendar;

public class GPMemberBean {
	private String gpmNumber, gpmName, gpmGender, gpmAge, gpmEmail, gpmPwd, gpmNick, gpmDate;
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

	public String getGpmNumber() {
		return gpmNumber;
	}

	public void setGpmNumber(String gpmNumber) {
		this.gpmNumber = gpmNumber;
	}

	public String getGpmName() {
		return gpmName;
	}

	public void setGpmName(String gpmName) {
		this.gpmName = gpmName;
	}

	public String getGpmGender() {
		return gpmGender;
	}

	public void setGpmGender(String gpmGender) {
		this.gpmGender = gpmGender;
	}

	public String getGpmAge() {
		return gpmAge;
	}

	public void setGpmAge(String gpmAge) {
		this.gpmAge = gpmAge;
	}

	public String getGpmEmail() {
		return gpmEmail;
	}

	public void setGpmEmail(String gpmEmail) {
		this.gpmEmail = gpmEmail;
	}

	public String getGpmPwd() {
		return gpmPwd;
	}

	public void setGpmPwd(String gpmPwd) {
		this.gpmPwd = gpmPwd;
	}

	public String getGpmNick() {
		return gpmNick;
	}

	public void setGpmNick(String gpmNick) {
		this.gpmNick = gpmNick;
	}

	public String getGpmDate() {
		return gpmDate;
	}
	
	public void setGpmDate() {
	Calendar calender=Calendar.getInstance();
	int year=calender.get(Calendar.YEAR);
	int month=calender.get(Calendar.MONTH)+1;
	int day=calender.get(Calendar.DATE);
	this.gpmDate=year+"-"+month+"-"+day;
	}

	public void setGpmDate(String gpmDate) {
		this.gpmDate = gpmDate;
	}

	
}
