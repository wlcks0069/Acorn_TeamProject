package pack.gpm_controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.gpm_model.GPMemberDto;
import pack.gpm_model.GPMemberInter;

@Controller
public class GPMemberInfoSearchController {
	@Autowired
	private GPMemberInter gpmInter;	
	
	@RequestMapping(value="gpid_search", method=RequestMethod.GET)
	public String gpid_searchget(){
		return "gpid_search";
	}
	
	@RequestMapping(value="gpid_search", method=RequestMethod.POST)
	public ModelAndView gpid_searchpost(GPMemberBean searchingbean){
		String youremail=gpmInter.searchID(searchingbean);
		String[] infobox= {youremail,"ID"};
		if(youremail==null) {
			return new ModelAndView("gp_search_result_fail","infobox",infobox);
		}else {
			return new ModelAndView("gp_search_result","infobox",infobox);
		}
	}	
	
	@RequestMapping(value="gppw_search", method=RequestMethod.GET)
	public String gppw_searchget(){
		return "gppw_search";
	}
	
	@RequestMapping(value="gppw_search", method=RequestMethod.POST)
	public ModelAndView gppw_searchpost(GPMemberBean searchingbean) {
			String yourpassword=gpmInter.searchPW(searchingbean);
			String[] infobox= {yourpassword,"PW"};
			if(yourpassword==null) {
				return new ModelAndView("gp_search_result_fail","infobox",infobox);
			}else {
				return new ModelAndView("gp_search_result","infobox",infobox);
			}
	}	
}
