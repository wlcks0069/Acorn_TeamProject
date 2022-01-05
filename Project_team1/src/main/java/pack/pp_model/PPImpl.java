package pack.pp_model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.mc_controller.MCBoardBean;
import pack.mc_model.MCBoardDto;
import pack.pp_controller.PPBean;

@Repository
public class PPImpl extends SqlSessionDaoSupport implements PPInter{
	@Autowired
	public PPImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	} 
	
	@Override
	public ArrayList<PPDto> getList() {
		// 전체 게시글 리스트 획득 (더미)
		return (ArrayList)getSqlSession().selectList("pptotalMCList");
	}

	@Override
	public ArrayList<PPDto> getSearch(PPDto ppdto) {
		// 조건에 부합하는 게시글 리스트 획득 (마이페이지 Email 기반)
		return (ArrayList)getSqlSession().selectList("ppspecificMCList", ppdto);
	}

	/*	colorStack
	 * 	1. email을 통해 likedb에서 좋아한 글 번호 불러오기
	 * 	2. 불러온 번호들을 활용하여 MCdb에서 각 글들의 색 추출
	 * 	3. 불러온 색들 통계하여 노출할 수 있도록 반환
	 */
	@Override
	public HashMap colorStack(String ppemail) {
			
		// 좋아한 글 번호 리스트 불러오기 (likedb에서 발췌)
		ArrayList<MCBoardDto> list=(ArrayList)getSqlSession().selectList("ppMCwhatIlike", ppemail);
		
		//색을 담을 상자 생성 및 초기화
		String[] likedMccolor =new String[list.size()];
		
		for(int i=0;i<list.size();i++) {
			// 리스트에서 글 번호를 하나씩 추출
			int likedMcno=list.get(i).getMc_no();
			System.out.println("colorStack: 추출한 글 번호 "+likedMcno);
			// 추출된 글 번호를 글 색정보와 매칭해 String 배열에 담기
			System.out.println("colorStack: 추출한 글 번호로 추출한 색 정보 "+getSqlSession().selectOne("ppColoryouLiked",likedMcno));
			likedMccolor[i]=getSqlSession().selectOne("ppColoryouLiked",likedMcno);
		}
		
		//점검
		for(String tmp:likedMccolor) {
			System.out.println("colorStack: "+ppemail+"에서 추출한 글 색 정보 - "+tmp);
		}
	
		//현재 작성창에 설정되어있는 색상들에 대해 집계 (★★★추후 변경시 업데이트 필요★★★)
		/*
		  			<option value="#FFFC81">기쁨 / yellow</option>
					<option value="#EB6363">화남 / red</option>
					<option value="#A5C9E8">우울 / blue</option>
					<option value="#DDBADE">무서움 / purple</option>
					<option value="#bdbdbd">심심 / grey</option>
					<option value="#C5E1A5">평온 / green</option>
		 */
		
		//반환할 해시맵 생성
		HashMap<String, Integer> colorbox = new HashMap<>();
		
		//해시맵 요소 초기화
		colorbox.put("yellow", 0);
		colorbox.put("red", 0);
		colorbox.put("blue", 0);
		colorbox.put("purple", 0);
		colorbox.put("grey", 0);
		colorbox.put("green", 0);
		
		for (int i = 0; i < likedMccolor.length; i++) {
			switch (likedMccolor[i]) {
			case "#FFFC81":		//yellow
				int tmp=colorbox.get("yellow");
				tmp++;
				colorbox.put("yellow", tmp);
				System.out.println("colorStack: 노랑 추가");
				break;
			case "#EB6363":		//red
				int tmp1=colorbox.get("red");
				tmp1++;
				colorbox.put("red", tmp1);
				System.out.println("colorStack: 빨강 추가");
				break;
			case "#A5C9E8":		//blue
				int tmp2=colorbox.get("blue");
				tmp2++;
				colorbox.put("blue", tmp2);
				System.out.println("colorStack: 파랑 추가");
				break;
			case "#DDBADE":		//purple
				int tmp3=colorbox.get("purple");
				tmp3++;
				colorbox.put("purple", tmp3);
				System.out.println("colorStack: 보라 추가");
				break;
			case "#bdbdbd":		//grey
				int tmp4=colorbox.get("grey");
				tmp4++;
				colorbox.put("grey", tmp4);
				System.out.println("colorStack: 회색 추가");
				break;
			case "#C5E1A5":		//green
				int tmp5=colorbox.get("green");
				tmp5++;
				colorbox.put("green", tmp5);
				System.out.println("colorStack: 초록 추가");
				break;
			default:
				System.out.println("colorStack: "+"아무것도 없음");
				break;
			}
		}
		
		return colorbox;
	}


	/*	commentStack
	 * 	1. 작성 댓글 숫자 노출
	 * 	2. 숫자를 누르면 리스트로 전환
	 * 	3. 일반 게시판 형태의 댓글로, 글번호를 누르면 해당 글의 detail로 이동
	 */
	@Override
	public int commentStack(String ppemail) {
		// 작성한 댓글 갯수 반환
		return getSqlSession().selectOne("ppHowmanyComment",ppemail);
	}

	@Override
	public int totalCount() {
		// paging 처리를 위해 전체 레코드 건수 얻기 (더미)
		return getSqlSession().selectOne("pptotalCnt");
	}
	
}
