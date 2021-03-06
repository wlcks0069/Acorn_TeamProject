package pack.mc_model;

import java.util.ArrayList;
import java.util.List;

import pack.mc_controller.MCBoardBean;

public interface MCBoardInter {

	ArrayList<MCBoardDto> getList();
	ArrayList<MCBoardDto> getSearch(MCBoardDto bean);
	
	MCBoardDto getDetail(int selectedContentNumber);
	boolean mcWrite(MCBoardBean bean);
	boolean mcUpdate(MCBoardBean bean);
	boolean mcDelete(int selectedContentNumber);
	boolean mcLikeCount(int selectedContentNumber);
	boolean mcCommentCount(int selectedContentNumber);
	
	int currentMaxnum();
	int totalCount();
	String securecodeforUporDel(int selectedContentNumber);
}
