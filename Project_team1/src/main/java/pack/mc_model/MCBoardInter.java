package pack.mc_model;

import java.util.List;

import pack.mc_controller.MCBoardBean;

public interface MCBoardInter {

	List<MCBoardDto> getList();
	boolean mcWrite(MCBoardBean bean);
}
