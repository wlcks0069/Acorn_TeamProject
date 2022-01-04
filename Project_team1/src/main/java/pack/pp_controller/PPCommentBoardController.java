package pack.pp_controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_controller.CMBoardBean;
import pack.cm_model.CMBoardDto;
import pack.cm_model.CMBoardInter;
import pack.mc_controller.MCBoardBean;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class PPCommentBoardController {
	@Autowired
	private MCBoardInter mcboardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	
	@RequestMapping(value="ppcommentboard", method=RequestMethod.GET)
	public ModelAndView ppcommentBoardget(HttpSession session) {
		System.out.println("ppcommentBoardget: 호출 완료");

		//search 기능을 사용하여 나의 댓글만 불러오기 위한 작업
		CMBoardBean cmbean=new CMBoardBean();
		cmbean.setSearchParam("mem_email");
		cmbean.setSearchValue(session.getAttribute("idkey").toString());
		
		//불러온 나의 작성글을 리스트 정보화하여 입력
		ArrayList<CMBoardDto> pp_commentList=cmBoardInter.getSearch(cmbean);
		System.out.println("ppcommentBoardget: 코멘트 리스트 불러오기 완료/테스트 "+pp_commentList.get(0).getCm_commentcontent());
		
		
		return new ModelAndView("pp_comment_board","ppcommentlist",pp_commentList);
	}
}
