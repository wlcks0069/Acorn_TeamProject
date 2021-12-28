package aa.bb.db;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SangpumController {
	@Autowired
	private DbService dbService;
	
	@RequestMapping("sangpumdb")
	public ModelAndView dbtest() throws Exception{
		List<SangpumDto> list=new ArrayList<SangpumDto>();
		list=dbService.getList();
		
		return new ModelAndView("sanglist", "list", list);
	}
}
