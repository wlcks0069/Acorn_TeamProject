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
<<<<<<< HEAD
	public ModelAndView cmBoard(
			@RequestParam("page") int page, 
			@RequestParam("mc_no") String mc_no,
			@RequestParam("mc_page") int mc_page,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist,
			HttpSession session) {
		
			totalRecord = cmBoardInter.totalCount();
			MCBoardDto searchedData = boardInter.getDetail(mc_no);
			String searchedContent = searchedData.getMc_content();
			String color = searchedData.getMc_color();
			int like = searchedData.getMc_like();
			ArrayList<CMBoardDto> cmList = cmBoardInter.getList(mc_no);
			ArrayList<CMBoardDto> result = getListData(cmList, page);
			String email = searchedData.getMem_email();
=======
	public ModelAndView cmBoard( @RequestParam("mc_no") String mc_no,
			@RequestParam("mc_page") int mc_page) {
>>>>>>> branch 'main' of https://github.com/wlcks0069/Acorn_TeamProject.git

<<<<<<< HEAD
			System.out.println("CMBoardController_gen: 호출 완료");
=======
		MCBoardDto searchedData = boardInter.getDetail(mc_no);
		String searchedContent = searchedData.getMc_content();
		String color = searchedData.getMc_color();
		int like = searchedData.getMc_like();
		ArrayList<CMBoardDto> cmList = cmBoardInter.getList(mc_no);
		String email = searchedData.getMem_email();
>>>>>>> branch 'main' of https://github.com/wlcks0069/Acorn_TeamProject.git

<<<<<<< HEAD
			ModelAndView andView = new ModelAndView("cm_list");
			andView.addObject("cmcontentslist", result);
			andView.addObject("totalpage", getTotalPage());
			andView.addObject("page", page);
			andView.addObject("mc_content", searchedContent);
			andView.addObject("color", color);
			andView.addObject("mc_no", mc_no);
			andView.addObject("like", like);
			andView.addObject("mc_page",mc_page);
			andView.addObject("mem_email", email);
			andView.addObject("isppmclist", isppmclist);
			andView.addObject("isppcommentlist", isppcommentlist);
			return andView;
=======
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
>>>>>>> branch 'main' of https://github.com/wlcks0069/Acorn_TeamProject.git
	}
}
