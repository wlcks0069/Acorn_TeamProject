package pack.mc_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.like_controller.LKBean;
import pack.like_model.LKDto;
import pack.like_model.LKImpl;
import pack.like_model.LKInter;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class MCLikeController {
	@Autowired
	private MCBoardInter mcBoardInter;
	@Autowired
	private LKInter LKInter;
	
	@RequestMapping(value="like",method=RequestMethod.GET)
	public String like(@RequestParam("mc_no")int mc_no,
			@RequestParam("page") int page,
			@RequestParam("isppmclist") boolean isppmclist,
			@RequestParam("isppcommentlist") boolean isppcommentlist,
			HttpSession session) {
		
		// lkBean에 좋아요가 눌린 글 번호와 좋아요를 누른 당사자의 메일을 셋팅
		LKBean lkBean = new LKBean();
		lkBean.setMc_no(mc_no);
		lkBean.setMem_email(session.getAttribute("idkey").toString());
		lkBean.setLike_date();

		// 메일, 좋아요가 일치하는 것이 있는지 DB에서 검색
		// 있으면 좋아요 취소, 없으면 좋아요 입력
		ArrayList<LKDto> lk_List = LKInter.getOne(lkBean);
		
		//없음 - 등록함
		if(lk_List.isEmpty()) {
			//게시글의 좋아요 카운트 증가
			mcBoardInter.mcLikeCount(mc_no);
			//좋아요 등록
			LKInter.lkinsert(lkBean);
			//회귀
			return "redirect:/cmboard?page="+page+"&&mc_no="+mc_no+"&&mc_page=1&&isppmclist="+isppmclist+"&&isppcommentlist="+isppcommentlist;
		}
		//있음 - 취소함
		else {
			//게시글의 좋아요 카운트 감소
			mcBoardInter.mcLikeCountminus(mc_no);
			//좋아요 삭제
			LKInter.lkdelete(lkBean);
			//회귀
			return "redirect:/cmboard?page="+page+"&&mc_no="+mc_no+"&&mc_page=1&&isppmclist="+isppmclist+"&&isppcommentlist="+isppcommentlist;
		}
		
		
		
	}
}
