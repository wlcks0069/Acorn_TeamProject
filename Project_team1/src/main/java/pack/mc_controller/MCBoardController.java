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
		List<MCBoardDto> list= boardInter.getList();
		return new ModelAndView("mc_list","list",list);
	}
}
