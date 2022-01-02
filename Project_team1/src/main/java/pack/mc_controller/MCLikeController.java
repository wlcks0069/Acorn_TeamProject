package pack.mc_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.mc_model.MCBoardInter;

@Controller
public class MCLikeController {
	@Autowired
	private MCBoardInter mcBoardInter;
	
	@RequestMapping(value="like",method=RequestMethod.GET)
	public String like(@RequestParam("mc_no")int mc_no) {
		
		mcBoardInter.mcLikeCount(mc_no);
		
		return "redirect:/cmboard?page=1&&mc_no="+mc_no+"mc_page=1";
	}
}
