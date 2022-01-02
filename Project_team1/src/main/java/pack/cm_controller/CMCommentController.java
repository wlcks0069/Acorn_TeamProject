package pack.cm_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_model.CMBoardInter;
import pack.gpm_model.GPMemberInter;
import pack.mc_model.MCBoardInter;


/*
 * CM은 CoMment에서 따왔습니다
 * 
 * MC영역의 comment controller를 복사해와서 몇개 명령어만 바꾼 상태입니다
 * MC영역의 controller를 삭제할지 아니면 변형할지는 추후 개발 단계에 따라 판단하는게 좋을 것 같아 삭제하지 않았습니다
 * 
 */

@Controller
public class CMCommentController {
	@Autowired
	private CMBoardInter cmBoardInter;
	@Autowired
	private GPMemberInter gpminter;
	
	String currentUser="";
	
	@RequestMapping(value = "cmcomment", method = RequestMethod.GET)
	public ModelAndView cmcomment_get(HttpSession session,
			@RequestParam("mc_no")String mc_no) {
		
		currentUser=(String) session.getAttribute("idkey");
		
		ModelAndView view_cmcomment=new ModelAndView("cm_comment");
		view_cmcomment.addObject("mc_no",mc_no);
		view_cmcomment.addObject("usernick",gpminter.getNick(currentUser)); 
		
		return view_cmcomment;
	}
	
	@RequestMapping(value = "cmcomment", method = RequestMethod.POST)
	public String cmcomment_post(CMBoardBean cmbean,
			@RequestParam("mc_no")int mc_no) {
		cmbean.setMc_no(mc_no);
		cmbean.setCm_date();
		cmbean.setMem_email(currentUser);
		cmbean.setMem_nick(gpminter.getNick(currentUser));
		
		int newNum=cmBoardInter.currentMaxnum()+1;
		
		cmbean.setCm_no(newNum);
		
		boolean result = cmBoardInter.cmWrite(cmbean);
		
		if(result) {
			System.out.println("cmcomment_post: 댓글 입력 완료");
			return "redirect:/cmboard?page=1&&mc_no="+mc_no+"&&mc_page=1";
			//디테일로 이동하지 않고 보드로 이동하는 것으로 확인
		}
		else
			return "redirect:/error.jsp";
	}
}
