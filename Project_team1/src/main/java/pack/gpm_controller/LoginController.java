package pack.gpm_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.gpm_model.GPMemberInter;

@Controller
public class LoginController {
	@Autowired
	private GPMemberInter gpmInter;	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginGet(HttpSession session){
		if(session.getAttribute("idkey")==null) {
			return "redirect:/index.jsp";	//로그인 안한 경우 초기화면으로 되돌려보냄
		} else {
			return "redirect:mcboard";	//로그인 한 경우
		}
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginPost(HttpSession session,
			@RequestParam("id")String id,
			@RequestParam("pwd")String pwd){
		
		if(gpmInter.login(id, pwd)) {
			session.setAttribute("idkey", id);
			return "redirect:mcboard?page=1";	//로그인 한 경우
		} else {
			return "redirect:/error.jsp";	//로그인 망한 경우
		}
	}	
}
