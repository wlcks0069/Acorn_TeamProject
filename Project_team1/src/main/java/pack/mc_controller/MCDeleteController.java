package pack.mc_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_model.CMBoardInter;
import pack.mc_model.MCBoardInter;

@Controller
public class MCDeleteController {
	@Autowired
	private MCBoardInter mcBoardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	
	@RequestMapping(value="mcdelete",method=RequestMethod.GET)
	public ModelAndView mcDeletePeocess(@RequestParam("mc_no")String mc_no) {
				
		return new ModelAndView("mc_delete","mc_no",mc_no);
		
	}
	
	@RequestMapping(value="mcdelete",method=RequestMethod.POST)
	public String mcDelete(@RequestParam("mc_no")String mc_no) {
		
		boolean isDeleted=mcBoardInter.mcDelete(mc_no);
		boolean isCmDeleted=cmBoardInter.cmDelete(mc_no);
		System.out.println(isCmDeleted);
		if(isDeleted&&isCmDeleted) {
			return "redirect:/mcboard?page=1";
		}else {
			return "redirect:/error.jsp";
		}
		
	}
}
