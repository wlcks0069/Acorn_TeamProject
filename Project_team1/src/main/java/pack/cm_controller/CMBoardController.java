package pack.cm_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_model.CMBoardDto;
import pack.cm_model.CMBoardInter;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class CMBoardController {
	@Autowired
	private MCBoardInter boardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	
	@RequestMapping(value = "cmboard", method = RequestMethod.GET)
	public ModelAndView cmBoard( @RequestParam("mc_no") String mc_no,
			@RequestParam("mc_page") int mc_page) {

		MCBoardDto searchedData = boardInter.getDetail(mc_no);
		String searchedContent = searchedData.getMc_content();
		String color = searchedData.getMc_color();
		int like = searchedData.getMc_like();
		ArrayList<CMBoardDto> cmList = cmBoardInter.getList(mc_no);
		String email = searchedData.getMem_email();

		System.out.println("CMBoardController: 호출 완료");

		ModelAndView andView = new ModelAndView("cm_list");
		andView.addObject("cmcontentslist", cmList);
		andView.addObject("mc_content", searchedContent);
		andView.addObject("color", color);
		andView.addObject("mc_no", mc_no);
		andView.addObject("like", like);
		andView.addObject("mc_page",mc_page);
		andView.addObject("mem_email", email);
		return andView;
	}
}
