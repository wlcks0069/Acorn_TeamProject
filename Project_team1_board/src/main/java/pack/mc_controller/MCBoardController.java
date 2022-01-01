package pack.mc_controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class MCBoardController {
	@Autowired
	private MCBoardInter boardInter;
	
	@RequestMapping("mcboard")
	public ModelAndView mcBoard() {
		System.out.println("MCBoardController: 호출 완료");
		ArrayList<MCBoardDto> list= boardInter.getList();
		System.out.println("MCBoardController: 0번 인덱스 자료 본문 확인 "+list.get(0).getMc_content());
		
		return new ModelAndView("mc_list","maincontentslist",list);
	}
}
