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
	
	@RequestMapping(value = "cmcomment", method = RequestMethod.GET)
	public ModelAndView cmcomment_get(HttpSession session,
			@RequestParam("mc_no")String mc_no,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist) {
		
		System.out.println("cmcomment_get: 호출 완료");
		//받은 물건 확인
		System.out.println("cmcomment_get: 이메일: "+(String) session.getAttribute("idkey"));
		System.out.println("cmcomment_get: 본문글번호: "+mc_no);
		
		//ModelAndView에 세팅하여 cm_comment.jsp로 넘김
		ModelAndView view_cmcomment=new ModelAndView("cm_comment");
		view_cmcomment.addObject("mc_no",mc_no);
		view_cmcomment.addObject("usernick",gpminter.getNick((String) session.getAttribute("idkey"))); 
		view_cmcomment.addObject("isppmclist", isppmclist);
		view_cmcomment.addObject("isppcommentlist", isppcommentlist);
		
		return view_cmcomment;
	}
	
	@RequestMapping(value = "cmcomment", method = RequestMethod.POST)
	public String cmcomment_post(CMBoardBean cmbean,
			@RequestParam("mc_no")int mc_no,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist,
			HttpSession session) {
		
		System.out.println("cmcomment_post: 호출 완료");
		//본문 내용이 이상없이 세팅되어 왔는지 확인하기
		System.out.println("cmcomment_post: 받은 내용 "+cmbean.getCm_commentcontent());
		
		//셋팅 (본문내용은 이미 잘 들어와있으므로, 다른 DB요소만 기입)
		int commentNum=cmBoardInter.currentMaxnum()+1;
		cmbean.setCm_no(commentNum);
		cmbean.setMc_no(mc_no);
		cmbean.setMem_nick(gpminter.getNick((String) session.getAttribute("idkey")));
		cmbean.setMem_email((String) session.getAttribute("idkey"));
		cmbean.setCm_date();
		
		boolean result = cmBoardInter.cmWrite(cmbean);
		
		if(result) {
			System.out.println("cmcomment_post: 댓글 입력 완료");
			return "redirect:/cmboard?page=1&&mc_no="+mc_no+"&&mc_page=1&&isppmclist="+isppmclist+"&&isppcommentlist="+isppcommentlist;
			//디테일로 이동하지 않고 보드로 이동하는 것으로 확인
		}
		else
			return "redirect:/error.jsp";
	}
}
