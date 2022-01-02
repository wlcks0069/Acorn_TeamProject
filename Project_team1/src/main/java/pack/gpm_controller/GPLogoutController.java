package pack.gpm_controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GPLogoutController {
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃됨");
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
}
