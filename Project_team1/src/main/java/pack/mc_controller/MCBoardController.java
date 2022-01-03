package pack.mc_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class MCBoardController {
	@Autowired
	private MCBoardInter boardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	
	private int totalRecord;		//전체 레코드 수
	private int pageList=6;	//한 페이지 당 출력 행 수
	private int totalPage;		//전체 페이지 수
	
	public ArrayList<MCBoardDto> getListData(ArrayList<MCBoardDto> list, int page){	//12, 1
		ArrayList<MCBoardDto> result=new ArrayList<MCBoardDto>();
		
		int start=(page-1)*pageList;	//0, 5, 10, ...
		int size = pageList <= list.size() - start ? pageList : list.size() - start;	//삼항 연산자
		
		for(int i=0; i<size; i++) {
			result.add(i, list.get(start+i));
		}
		
		return result;
	}
	
	public int getTotalPage() {	//총 페이지 수 얻기
		totalPage=totalRecord/pageList;
		if(totalRecord%pageList>0) totalPage+=1;	//자투리 페이지 연산
		return totalPage;
	}
	
	@RequestMapping(value="mcboard", method=RequestMethod.GET)
	public ModelAndView mcBoard(@RequestParam("page")int page, HttpSession session) {
		String mc_no="32";
		totalRecord=boardInter.totalCount();
		
		ArrayList<MCBoardDto> mcList=boardInter.getList();
		ArrayList<MCBoardDto> result=getListData(mcList, page);
		ArrayList<String> numList=new ArrayList<String>();
		
		System.out.println("MCBoardController: 호출 완료");
		System.out.println("MCBoardController: 0번 인덱스 자료 본문 확인 "+mcList.get(0).getMc_content());
		
		for(int i=0; i<result.size(); i++) {
			String a=Integer.toString(result.get(i).getMc_no());
			numList.add(a);
		}
		ArrayList<CMBoardDto> cmList=cmBoardInter.getList(mc_no);
		
		session.setAttribute("numList", numList);
		session.setAttribute("cmList", cmList);
		
		ModelAndView andView=new ModelAndView("mc_list");
		andView.addObject("maincontentslist",result);
		andView.addObject("totalpage",getTotalPage());
		andView.addObject("page",page);
		andView.addObject("cmList",cmList);
		
		return andView;
	}
	
	@RequestMapping(value="moremcboard", method=RequestMethod.POST)
	public ModelAndView moreMcBoard(@RequestParam("page")int page) {
		String mc_no="30";
		totalRecord=boardInter.totalCount();
		ArrayList<CMBoardDto> cmList=cmBoardInter.getList(mc_no);
		ArrayList<MCBoardDto> mcList=boardInter.getList();
		ArrayList<MCBoardDto> result=getListData(mcList, page);
		
		System.out.println("MCBoardController: 호출 완료");
		System.out.println("MCBoardController: 0번 인덱스 자료 본문 확인 "+mcList.get(0).getMc_content());
		
		ModelAndView moreView=new ModelAndView("more_mc_list");
		moreView.addObject("maincontentslist",result);
		moreView.addObject("totalpage",getTotalPage());
		moreView.addObject("page",page);
		moreView.addObject("cmList",cmList);
		
		return moreView;
	}
}



















