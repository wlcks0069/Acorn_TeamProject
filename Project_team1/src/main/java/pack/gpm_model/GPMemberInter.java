package pack.gpm_model;

import java.util.ArrayList;

import pack.gpm_controller.GPMemberBean;

public interface GPMemberInter {
	ArrayList<GPMemberDto> getList();
	ArrayList<GPMemberDto> getSearch(GPMemberBean gpmbean);
	
	boolean signUp(GPMemberBean bean);
	boolean login(String email, String pwd);
	String searchID(GPMemberBean gpmbean);
	String searchPW(GPMemberBean gpmbean);
	String getNick(String email);
	
	int currentMaxnum();
	boolean isExist(String email);
	
}
