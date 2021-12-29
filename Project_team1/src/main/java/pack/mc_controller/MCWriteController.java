package pack.mc_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.mc_model.MCBoardInter;

@Controller
public class MCWriteController {
	@Autowired
	private MCBoardInter boardInter;

	@RequestMapping(value = "mcwrite", method = RequestMethod.GET)
	public String writeProcess() {

		return "mc_write";
	}
}
