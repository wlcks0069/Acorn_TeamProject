package pack.pp_controller;

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
import pack.mc_controller.MCBoardBean;
import pack.mc_model.MCBoardDto;
import pack.mc_model.MCBoardInter;
import pack.pp_model.PPInter;

@Controller
public class PPBoardController {
	@Autowired
	private MCBoardInter mcboardInter;
	@Autowired
	private CMBoardInter cmBoardInter;
	@Autowired
	private PPInter ppInter;
	
	private int totalRecord;		//전체 레코드 수
	private int pageList=5;	//한 페이지 당 출력 행 수
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
	
	@RequestMapping(value="ppboard", method=RequestMethod.GET)
	public ModelAndView ppBoardget(HttpSession session) {
		
		totalRecord=mcboardInter.totalCount();
		
		
		//search 기능을 사용하여 나의 작성글만 불러오기 위한 작업
		MCBoardBean mcbean=new MCBoardBean();
		mcbean.setSearchParam("mem_email");
		mcbean.setSearchValue(session.getAttribute("idkey").toString());
		
		//search 기능을 사용하여 나의 구독글만 불러오기 위한 작업
		//아직 구현 단계 X (중간발표 이후 메인페이지에서도 노출될 수 있도록 구현 예정)
		
		//불러온 나의 작성글을 리스트 정보화하여 입력
		ArrayList<MCBoardDto> pp_mcList=mcboardInter.getSearch(mcbean);
		ArrayList<MCBoardDto> result=getListData(pp_mcList, 1);
		
		//좋아요 통계수치
		HashMap<String, Integer> colorbox=ppInter.colorStack(session.getAttribute("idkey").toString());
		
		//댓글 통계수치
		int commentcount=ppInter.commentStack(session.getAttribute("idkey").toString());
				
		System.out.println("PPBoardController: 호출 완료");
		System.out.println("PPBoardController: 0번 인덱스 자료 본문 확인 "+pp_mcList.get(0).getMc_content());
		
		ModelAndView ppandView=new ModelAndView("pp_board");
		ppandView.addObject("ppmaincontentslist",result);
		ppandView.addObject("totalpage",getTotalPage());
		ppandView.addObject("page",1);
		ppandView.addObject("colorbox",colorbox);
		ppandView.addObject("commentcount",commentcount);
		
		return ppandView;
	}
	
	@RequestMapping(value="ppmoreboard", method=RequestMethod.POST)
	public ModelAndView ppBoardpost(@RequestParam("page")int page,
			@RequestParam("currentEmail")String currentEmail) {
		System.out.println("PPBoardController: 호출 완료");
		System.out.println("PPBoardController: 받아온 이메일 "+currentEmail);

		totalRecord=mcboardInter.totalCount();
		
		//search 기능을 사용하여 나의 작성글만 불러오기 위한 작업
		MCBoardBean mcbean=new MCBoardBean();
		mcbean.setSearchParam("mem_email");
		mcbean.setSearchValue(currentEmail);
		
		//search 기능을 사용하여 나의 구독글만 불러오기 위한 작업
		//아직 구현 단계 X (중간발표 이후 메인페이지에서도 노출될 수 있도록 구현 예정)

		ArrayList<MCBoardDto> pp_searchedmcList=mcboardInter.getSearch(mcbean);
		ArrayList<MCBoardDto> pp_result=getListData(pp_searchedmcList, page);

		ArrayList<MCBoardDto> result=getListData(pp_searchedmcList, page);
		
		System.out.println("PPBoardController: 0번 인덱스 자료 본문 확인 "+pp_searchedmcList.get(0).getMc_content());
		
		ModelAndView moreppView=new ModelAndView("more_pp_list");
		moreppView.addObject("ppmaincontentslist",result);
		moreppView.addObject("totalpage",getTotalPage());
		moreppView.addObject("page",page);
		
		return moreppView;
	}
}



















