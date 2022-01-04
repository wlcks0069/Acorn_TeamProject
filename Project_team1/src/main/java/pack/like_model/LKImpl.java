package pack.like_model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.like_controller.LKBean;
import pack.mc_controller.MCBoardBean;

@Repository
public class LKImpl extends SqlSessionDaoSupport implements LKInter{
	@Autowired
	public LKImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<LKDto> getList() {
		// 전체 게시글 리스트 획득
		return (ArrayList)getSqlSession().selectList("totalLKList");
	}

	@Override
	public ArrayList<LKDto> getSearch(LKBean lkbean) {
		// 조건에 부합하는 게시글 리스트 획득
		return (ArrayList)getSqlSession().selectList("specificLKList", lkbean);
	}

	@Override
	public ArrayList<LKDto> getOne(LKBean lkbean) {
		// 이메일과 글번호가 일치하는 좋아요 정보 획득
		return (ArrayList)getSqlSession().selectList("specificLK", lkbean);
	}
	
	@Override
	public boolean lkinsert(LKBean lkbean) {
		// 신규 좋아요 등록
		System.out.println("lkInsert: 받은 번호: " + lkbean.getMc_no());
		System.out.println("lkInsert: 받은 email: " + lkbean.getMem_email());
		System.out.println("lkInsert: 받은 일자: " + lkbean.getLike_date());
		System.out.println("lkInsert: 넘겨받은 정보 확인 완료");

		int result = getSqlSession().insert("lkInsert", lkbean);
		System.out.println("lkInsert: lkInsert sql 구문 호출 완료");

		if (result > 0) {
			System.out.println("lkInsert: 신규 좋아요 등록 완료");
			return true;
		} else {
			System.out.println("lkInsert: 좋아요 등록 실패 (최종 단계 확인 필요)");
			return false;
		}
	}

	@Override
	public boolean lkdelete(LKBean lkbean) {
		// 좋아요 취소
		try {
			int result = getSqlSession().delete("lkDelete", lkbean);

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
		// 신규 글 작성 시 글 번호 획득
		if(getSqlSession().selectOne("lkcurrentMaxnum")==null) return 0;
		return getSqlSession().selectOne("lkcurrentMaxnum");
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

}
