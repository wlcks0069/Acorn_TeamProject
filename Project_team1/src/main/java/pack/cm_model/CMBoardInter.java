package pack.cm_model;

import java.util.ArrayList;

import pack.cm_controller.CMBoardBean;

public interface CMBoardInter {

	ArrayList<CMBoardDto> getList(String mc_no);
	ArrayList<CMBoardDto> getSearch(CMBoardDto bean);
	
	boolean cmWrite(CMBoardBean bean);
	boolean cmUpdate(CMBoardBean bean);
	boolean cmDelete(int selectedContentNumber);
	
	int cmCount(int mc_no);	//댓글 수 세기
	
	int currentMaxnum();
	int totalCount();
	String securecodeforUporDel_cm(int selectedContentNumber);
}
