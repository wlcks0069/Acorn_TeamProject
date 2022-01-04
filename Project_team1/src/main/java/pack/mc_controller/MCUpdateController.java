package pack.mc_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.gpm_model.GPMemberInter;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class MCUpdateController {
	@Autowired
	private MCBoardInter mcBoardInter;
	@Autowired
	private GPMemberInter gpminter;

	String currentUser = "";

	@RequestMapping(value = "mcupdate", method = RequestMethod.GET)
	public ModelAndView mcUpdateProcess(@RequestParam("mc_no") String mc_no, HttpSession session) {

		currentUser = (String) session.getAttribute("idkey");
		System.out.println("MCUpdateController: 현재 User Email " + currentUser);

		MCBoardDto contentData = mcBoardInter.getDetail(mc_no);

		int brightness = contentData.getMc_brightness();
		String color = contentData.getMc_color();
		String content = contentData.getMc_content();

		ModelAndView andView = new ModelAndView("mc_update");
		andView.addObject("useremail", currentUser);
		andView.addObject("usernick", gpminter.getNick(currentUser));
		andView.addObject("brightness", brightness);
		andView.addObject("color", color);
		andView.addObject("content", content);
		andView.addObject("mc_no", mc_no);

		return andView;
	}

	@RequestMapping(value = "mcupdate", method = RequestMethod.POST)
	public String mcUpdate(MCBoardBean bean, @RequestParam("color") String color, @RequestParam("mc_no")String mc_no) {
		System.out.println("mcUpdate 요청 받음");
		bean.setMc_date();
		bean.setMem_email(currentUser);
		bean.setMem_nick(gpminter.getNick(currentUser));
		boolean isSuccess = mcBoardInter.mcUpdate(bean);

		if (isSuccess) {
			return "redirect:/cmboard?page=1&&mc_no=" + mc_no+"&&mc_page=1";
		} else {
			return "redirect:/error.jsp";
		}

	}
}
