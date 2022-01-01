package pack.cm_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.cm_model.CMBoardDto;
import pack.cm_model.CMBoardInter;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;

@Controller
public class CMBoardController {
	@Autowired
	private MCBoardInter boardInter;
	@Autowired
	private CMBoardInter cmBoardInter;

	private int totalRecord; // 전체 레코드 수
	private int pageList = 10; // 한 페이지 당 출력 행 수
	private int totalPage; // 전체 페이지 수

	public ArrayList<CMBoardDto> getListData(ArrayList<CMBoardDto> list, int page) { // 12, 1
		ArrayList<CMBoardDto> result = new ArrayList<CMBoardDto>();

		int start = (page - 1) * pageList; // 0, 5, 10, ...
		int size = pageList <= list.size() - start ? pageList : list.size() - start; // 삼항 연산자

		for (int i = 0; i < size; i++) {
			result.add(i, list.get(start + i));
		}

		return result;
	}

	public int getTotalPage() { // 총 페이지 수 얻기
		totalPage = totalRecord / pageList;
		if (totalRecord % pageList > 0)
			totalPage += 1; // 자투리 페이지 연산
		return totalPage;
	}

	@RequestMapping(value = "cmboard", method = RequestMethod.GET)
	public ModelAndView cmBoard(@RequestParam("page") int page, @RequestParam("mc_no")String mc_no) {
		
		totalRecord = cmBoardInter.totalCount();
		MCBoardDto searchedData=boardInter.getDetail(mc_no);
		String searchedContent=searchedData.getMc_content();
		String color=searchedData.getMc_color();
		int like=searchedData.getMc_like();
		ArrayList<CMBoardDto> cmList = cmBoardInter.getList(mc_no);
		ArrayList<CMBoardDto> result = getListData(cmList, page);

		System.out.println("CMBoardController: 호출 완료");

		ModelAndView andView = new ModelAndView("cm_list");
		andView.addObject("cmcontentslist", result);
		andView.addObject("totalpage", getTotalPage());
		andView.addObject("page", page);
		andView.addObject("mc_content",searchedContent);
		andView.addObject("color",color);
		andView.addObject("mc_no",mc_no);
		andView.addObject("like",like);
		return andView;
	}
}
