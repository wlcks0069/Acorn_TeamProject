package aa.bb.cc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@RequestMapping("test")
	public ModelAndView abc() {
		return new ModelAndView("list","msg","성공");
	}
}
