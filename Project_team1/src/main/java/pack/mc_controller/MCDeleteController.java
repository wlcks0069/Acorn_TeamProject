package pack.mc_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_controller.CMBoardBean;
import pack.cm_model.CMBoardInter;
import pack.like_controller.LKBean;
import pack.like_model.LKInter;
import pack.mc_model.MCBoardInter;

@Controller
public class MCDeleteController {
	@Autowired
	private MCBoardInter mcBoardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	@Autowired
	private LKInter lkInter;
	
	@RequestMapping(value="mcdelete",method=RequestMethod.GET)
	public ModelAndView mcDeleteget(
			@RequestParam("mc_no")String mc_no,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist) {

		System.out.println("mcDeleteget: get 호출 성공");
		System.out.println("mcDeleteget: 삭제하려 받아온 글 번호 "+mc_no);

		ModelAndView andView=new ModelAndView("mc_delete");
		andView.addObject("mc_no", mc_no);
		andView.addObject("isppmclist", isppmclist);
		andView.addObject("isppcommentlist", isppcommentlist);
		
		return andView;
		
	}
	
	@RequestMapping(value="mcdelete",method=RequestMethod.POST)
	public String mcDeletepost(
			@RequestParam("mc_no")String mc_no,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist,
			HttpSession session) {
		
		System.out.println("mcDeleteget: post 호출 성공");
		System.out.println("mcDeleteget: 삭제하려 받아온 글 번호 "+mc_no);
		
		//글 지우기
		boolean isDeleted=mcBoardInter.mcDelete(mc_no);
		
		//글에 달린 댓글 지우기
		cmBoardInter.cmDelete(mc_no);

		
		//글에 달린 좋아요 지우기
		LKBean lkbean=new LKBean();
		lkbean.setMc_no(Integer.parseInt(mc_no));
		System.out.println("mcDeleteget: 삭제글번호 정상동작 확인 "+Integer.parseInt(mc_no)+"에 1을 더하면 "+(Integer.parseInt(mc_no)+1));

		lkbean.setMem_email(session.getAttribute("idkey").toString());
		System.out.println("mcDeleteget: 삭제하는 사람 "+session.getAttribute("idkey").toString());

		lkInter.lkdelete(lkbean);
		
		//검증
		System.out.println("mcDeleteget: isDeleted 검증 "+isDeleted);
		//댓글과 좋아요가 없을 경우, false 리턴으로 오류 발생
		
		if(isDeleted) {
			return "redirect:/mcboard?page=1";
		}else {
			return "redirect:/error.jsp";
		}
		
	}
}
