package pack.mc_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.gpm_model.GPMemberInter;
import pack.mc_model.MCBoardInter;

@Controller
public class MCCommentController {
	@Autowired
	private MCBoardInter mcBoardInter;
	@Autowired
	private GPMemberInter gpminter;
	
	String currentUser="";
	
	@RequestMapping(value = "mccomment", method = RequestMethod.GET)
	public ModelAndView mccomment_get(HttpSession session) {
		
		currentUser=(String) session.getAttribute("idkey");
		
		ModelAndView view_mccomment=new ModelAndView("mc_comment");
		view_mccomment.addObject("usernick",gpminter.getNick(currentUser)); 
		
		return view_mccomment;
	}
	
	@RequestMapping(value = "mccomment", method = RequestMethod.POST)
	public String mccomment_post(MCBoardBean mcbean) {
		mcbean.setMc_date();
		mcbean.setMem_email(currentUser);
		mcbean.setMem_nick(gpminter.getNick(currentUser));
		
		int newNum=mcBoardInter.currentMaxnum()+1;
		
		mcbean.setMc_no(newNum);
		
		boolean result = mcBoardInter.mcComment(mcbean);
		
		if(result) {
			System.out.println("mccomment_post: 댓글 입력 완료");
			return "redirect:/detail";	//추가 후 디테일로 이동
		}
		else
			return "redirect:/error.jsp";
	}
}
