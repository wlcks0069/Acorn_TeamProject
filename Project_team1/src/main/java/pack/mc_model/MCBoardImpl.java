package pack.mc_model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.mc_controller.MCBoardBean;

@Repository
public class MCBoardImpl extends SqlSessionDaoSupport implements MCBoardInter{
	@Autowired
	public MCBoardImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<MCBoardDto> getList() {
		// 전체 게시글 리스트 획득
		return (ArrayList)getSqlSession().selectList("totalMCList");
	}

	@Override
	public ArrayList<MCBoardDto> getSearch(MCBoardDto mcbean) {
		// 조건에 부합하는 게시글 리스트 획득
		return (ArrayList)getSqlSession().selectList("specificMCList", mcbean);
	}
	
	@Override
	public boolean mcWrite(MCBoardBean mcbean) {
		// 신규 글 작성
		System.out.println("mcWrite: 받은 번호: " + mcbean.getMc_no());
		System.out.println("mcWrite: 받은 닉네임: " + mcbean.getMem_nick());
		System.out.println("mcWrite: 받은 email: " + mcbean.getMem_email());
		System.out.println("mcWrite: 받은 내용: " + mcbean.getMc_content());
		System.out.println("mcWrite: 받은 색: " + mcbean.getMc_color());
		System.out.println("mcWrite: 받은 채도: " + mcbean.getMc_brightness());
		System.out.println("mcWrite: 받은 좋아요: " + mcbean.getMc_like());
		System.out.println("mcWrite: 받은 댓글: " + mcbean.getMc_comment());
		System.out.println("mcWrite: 받은 일자: " + mcbean.getMc_date());
		System.out.println("mcWrite: 넘겨받은 정보 확인 완료");

		int result = getSqlSession().insert("mcWrite", mcbean);
		System.out.println("mcWrite: mcWrite sql 구문 호출 완료");

		if (result > 0) {
			System.out.println("mcWrite: 신규 글 작성 완료");
			return true;
		} else {
			System.out.println("mcWrite: 글작성 실패 (최종 단계 확인 필요)");
			return false;
		}
	}

	@Override
	public MCBoardDto getDetail(int selectednum) {
		// 게시글 상세보기 (수정 및 댓글 등 추가 작업에서 활용)
		return getSqlSession().selectOne("mcGetDetail",selectednum);
	}

	@Override
	public boolean mcUpdate(MCBoardBean mcbean) {
		// 글 수정
		int result=getSqlSession().update("mcUpdate",mcbean);
		
		if(result>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean mcDelete(int selectednum) {
		// 글 삭제
		try {
			int result = getSqlSession().delete("mcDelete", selectednum);

			if (result > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean mcLikeCount(int selectednum) {
		// 좋아요 수 올리기
		int result=getSqlSession().update("mcLikeCount", selectednum);
		if(result>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean mcCommentCount(int selectednum) {
		// 댓글 수 올리기
		int result=getSqlSession().update("mcCommentCount", selectednum);
		if(result>0)
			return true;
		else
			return false;
	}

	@Override
	public int currentMaxnum() {
		// 신규 글 작성 시 글 번호 획득
		if(getSqlSession().selectOne("mccurrentMaxnum")==null) return 0;
		return getSqlSession().selectOne("mccurrentMaxnum");
	}

	@Override
	public int totalCount() {
		// paging 처리를 위해 전체 레코드 건수 얻기
		return getSqlSession().selectOne("totalCnt");
	}

	@Override
	public String securecodeforUporDel(int selectednum) {
		// 글 작성자만 수정 및 삭제를 할 수 있도록 해주는 구문
		return getSqlSession().selectOne("securecode",selectednum);
	}

	@Override
	public boolean mcComment(MCBoardBean bean) {
		// TODO Auto-generated method stub
		return false;
	}
}
