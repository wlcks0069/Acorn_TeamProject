package pack.pp_model;

import java.util.ArrayList;
import java.util.HashMap;

public interface PPInter {

	//기본 패키지
	ArrayList<PPDto> getList();
	ArrayList<PPDto> getSearch(PPDto ppdto);
	
	//통계 부문
	HashMap<String, Integer> colorStack(String ppemail);
	int commentStack(String ppemail);
		
	int totalCount();
}
