package aa.bb.cc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	@RequestMapping("hi")
	//@ResponseBody
	//public String aa() {
	public @ResponseBody String aa() {
		return "<h1>Hello Spring boot</h1>";
	}
	
	@RequestMapping("hi1")
	public @ResponseBody String bb() {
		return "<h1>스프링 부트 만세~</h1>";
	}
	
	@RequestMapping("hi2")
	public ModelAndView cc() {
		return new ModelAndView("hishow","msg","부트의 편리함을 경험하자");
	}
	
	@RequestMapping("hi3")
	public String dd() {
		return "hishow2";
	}
}
