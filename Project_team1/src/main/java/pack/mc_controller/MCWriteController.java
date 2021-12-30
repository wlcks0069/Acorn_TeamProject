package pack.mc_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.gpm_model.GPMemberDto;
import pack.gpm_model.GPMemberInter;
import pack.mc_model.MCBoardInter;

@Controller
public class MCWriteController {
	@Autowired
	private MCBoardInter mcboardInter;
	@Autowired
	private GPMemberInter gpminter;

	String currentUser="";
	
	@RequestMapping(value = "mcwrite", method = RequestMethod.GET)
	public ModelAndView mcwrite_get(HttpSession session) {
		
		currentUser=(String) session.getAttribute("idkey");
		System.out.println("MCWriteController: 현재 User Email "+currentUser);
		
		
		
		ModelAndView view_mcwrite=new ModelAndView("mc_write");
		view_mcwrite.addObject("useremail",currentUser); 
		view_mcwrite.addObject("usernick",gpminter.getNick(currentUser)); 
		
		return view_mcwrite;
	}
	
	@RequestMapping(value = "mcwrite", method = RequestMethod.POST)
	public String mcwrite_post(MCBoardBean mcbean,
			@RequestParam("color")String color, @RequestParam("brightness")int brightness) {
		System.out.println("mcwrite_post: 호출 완료");
		mcbean.setMc_date();
		mcbean.setMem_email(currentUser);
		mcbean.setMem_nick(gpminter.getNick(currentUser));
		System.out.println("mcwrite_post: bean을 통한 메소드 setMc_date 호출 완료");
		System.out.println("mcwrite_post: 닉네임: "+mcbean.getMem_nick());
		System.out.println("mcwrite_post: 이메일: "+mcbean.getMem_email());
		System.out.println("mcwrite_post: 본문: "+mcbean.getMc_content());
		System.out.println("mcwrite_post: 색: "+mcbean.getMc_color());
		System.out.println("mcwrite_post: 채도: "+mcbean.getMc_brightness());
		System.out.println("mcwrite_post: 좋아요 수 (0): "+mcbean.getMc_like());
		System.out.println("mcwrite_post: 댓글 수 (0): "+mcbean.getMc_comment());
		System.out.println("mcwrite_post: 작성일자: "+mcbean.getMc_date());

		//새 글번호는 현재 레코드에서 가장 큰번호를 구해 +1
		int newNum=mcboardInter.currentMaxnum()+1;
		System.out.println("mcwrite_post: 갱신된 글번호 획득 완료 "+newNum);

		mcbean.setMc_no(newNum);
		System.out.println("mcwrite_post: 글번호 입력 완료");
		System.out.println("mcwrite_post: 입력된 글번호 확인 "+mcbean.getMc_no());

		boolean result=mcboardInter.mcWrite(mcbean);
		System.out.println("mcwrite_post: sql 함수를 호출 완료");

		if(result) {
			System.out.println("mcwrite_post: 회원정보 입력 완료");
			return "redirect:/mcboard?page=1";	//추가 후 리스트로 이동
		}
		else
			return "redirect:/error.jsp";
	}
}
