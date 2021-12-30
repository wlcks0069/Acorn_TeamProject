package pack.pp_model;

import java.util.ArrayList;
import java.util.List;

import pack.mc_controller.MCBoardBean;

public interface PPInter {

	ArrayList<PPDto> getList();
	ArrayList<PPDto> getSearch(PPDto bean);
	
	PPDto getDetail(int selectedContentNumber);
	
	boolean ppWrite(MCBoardBean bean);
	boolean mcUpdate(MCBoardBean bean);
	boolean mcDelete(int selectedContentNumber);
	boolean mcLikeCount(int selectedContentNumber);
	boolean mcCommentCount(int selectedContentNumber);
	
	boolean mcComment(MCBoardBean bean);
	
	int currentMaxnum();
	int totalCount();
	String securecodeforUporDel(int selectedContentNumber);
}
