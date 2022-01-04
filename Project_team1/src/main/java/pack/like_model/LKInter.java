package pack.like_model;

import java.util.ArrayList;

import pack.like_controller.LKBean;

public interface LKInter {

	ArrayList<LKDto> getList();
	ArrayList<LKDto> getSearch(LKBean bean);
	ArrayList<LKDto> getOne(LKBean bean);
	
	
	boolean lkinsert(LKBean bean);
	boolean lkdelete(LKBean lkbean);
	
	int currentMaxnum();
	int totalCount();
	String securecodeforUporDel(int selectedContentNumber);
}
