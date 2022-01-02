package pack.cm_model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.cm_controller.CMBoardBean;
import pack.mc_controller.MCBoardBean;

@Repository
public class CMBoardImpl extends SqlSessionDaoSupport implements CMBoardInter{
	@Autowired
	public CMBoardImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<CMBoardDto> getList(String mc_no) {
		// 전체 댓글 리스트 획득
		return (ArrayList)getSqlSession().selectList("cmNoSearch", mc_no);
	}

	@Override
	public ArrayList<CMBoardDto> getSearch(CMBoardDto cmbean) {
		// 조건에 부합하는 댓글 리스트 획득
		return (ArrayList)getSqlSession().selectList("specificCMList", cmbean);
	}
	
	@Override
	public boolean cmWrite(CMBoardBean cmbean) {
		// 신규 댓글 작성
		System.out.println("cmWrite: 받은 댓글번호: " + cmbean.getCm_no());
		System.out.println("cmWrite: 받은 닉네임: " + cmbean.getMem_nick());
		System.out.println("cmWrite: 받은 email: " + cmbean.getMem_email());
		System.out.println("cmWrite: 받은 글번호: " + cmbean.getMc_no());
		System.out.println("cmWrite: 받은 댓글 내용: " + cmbean.getCm_commentcontent());
		System.out.println("cmWrite: 받은 일자: " + cmbean.getCm_date());
		System.out.println("cmWrite: 넘겨받은 정보 확인 완료");

		int result = getSqlSession().insert("cmWrite", cmbean);
		System.out.println("cmWrite: cmWrite sql 구문 호출 완료");

		if (result > 0) {
			System.out.println("cmWrite: 신규 글 작성 완료");
			getSqlSession().update("mcCommentCount",cmbean.getMc_no());
			return true;
		} else {
			System.out.println("cmWrite: 글작성 실패 (최종 단계 확인 필요)");
			return false;
		}
	}

	@Override
	public boolean cmUpdate(CMBoardBean cmbean) {
		// 댓글 수정
		int result=getSqlSession().update("cmUpdate",cmbean);
		
		if(result>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean cmDelete(String selectednum) {
		// 댓글 삭제
		try {
			int result = getSqlSession().delete("cmDelete", selectednum);

			if (result > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public int currentMaxnum() {
		// 신규 댓글 작성 시 글 번호 획득
		if(getSqlSession().selectOne("cmcurrentMaxnum")==null) return 0;
		return getSqlSession().selectOne("cmcurrentMaxnum");
	}

	@Override
	public int totalCount() {
		// paging 처리를 위해 전체 레코드 건수 얻기 (더미)
		return getSqlSession().selectOne("cmtotalCnt");
	}

	@Override
	public String securecodeforUporDel_cm(int selectednum) {
		// 댓글 작성자만 수정 및 삭제를 할 수 있도록 해주는 구문
		return getSqlSession().selectOne("cmsecurecode",selectednum);
	}

	@Override
	public int cmCount(int mc_no) {
		// 각 게시글의 댓글 수 구하기
		// 댓글 작성시가 아니라 게시글 단위에서 불러올 법 함
		return getSqlSession().selectOne("cmCount");
	}
}
