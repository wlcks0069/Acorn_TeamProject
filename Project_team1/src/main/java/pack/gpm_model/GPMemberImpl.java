package pack.gpm_model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.gpm_controller.GPMemberBean;

@Repository
public class GPMemberImpl extends SqlSessionDaoSupport implements GPMemberInter {

	/*
	 * GPMemberDataMapper에서 미리 만들어 놓은 SQL 구문을 끌어와 사용할 수 있도록 구현함
	 * 
	 * 예를 들어, getList 메소드에서 사용한 "totalGPMList"는 GPMemberDataMapper내에서
	 * id="totalGPMList"로 설정이 되어있음
	 */

	@Autowired
	public GPMemberImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<GPMemberDto> getList() { // 전체 회원리스트 획득
		return (ArrayList) getSqlSession().selectList("totalGPMList");
	}

	@Override
	public ArrayList<GPMemberDto> getSearch(GPMemberBean gpmbean) { // 조건에 부합하는 회원리스트 획득
		return (ArrayList) getSqlSession().selectList("specificGPMList", gpmbean);
	}

	@Override
	public boolean signUp(GPMemberBean gpmbean) { // 신규 회원 가입
		if (isExist(gpmbean.getGpmEmail())) {
			System.out.println("signUp: 회원가입 실패 (중복된 email)");
			return false;
		} else {
			System.out.println("signUp: 받은 번호: " + gpmbean.getGpmNumber());
			System.out.println("signUp: 받은 이름: " + gpmbean.getGpmName());
			System.out.println("signUp: 받은 성별: " + gpmbean.getGpmGender());
			System.out.println("signUp: 받은 나이: " + gpmbean.getGpmAge());
			System.out.println("signUp: 받은 email: " + gpmbean.getGpmEmail());
			System.out.println("signUp: 받은 비밀번호: " + gpmbean.getGpmPwd());
			System.out.println("signUp: 받은 닉네임: " + gpmbean.getGpmNick());
			System.out.println("signUp: 받은 일자: " + gpmbean.getGpmDate());
			System.out.println("signUp: 넘겨받은 정보 확인 완료");

			int result = getSqlSession().insert("signUp", gpmbean);
			System.out.println("signUp: signUp sql 구문 호출 완료");

			if (result > 0) {
				System.out.println("signUp: 회원가입 완료");
				return true;
			} else {
				System.out.println("signUp: 회원가입 실패 (최종 단계 확인 필요)");
				return false;
			}
		}
	}

	@Override
	public String searchID(GPMemberBean gpmbean) { // 이름과 나이로 ID 찾기
		return getSqlSession().selectOne("getemailbynameandage", gpmbean);
	}

	@Override
	public String searchPW(GPMemberBean gpmbean) { // ID로 비밀번호 찾기
		return getSqlSession().selectOne("getpwdbyemail", gpmbean);
	}

	@Override
	public int currentMaxnum() { // insert시 번호 자동증가를 위해 현 테이블에서 가장 큰 번호 얻기
		if (getSqlSession().selectOne("gpmcurrentMaxnum") == null)
			return 0;
		return getSqlSession().selectOne("gpmcurrentMaxnum");
	}

	@Override
	public boolean isExist(String gpmEmail) { // signUp시 중복 이메일 조회
		String result = getSqlSession().selectOne("emaildoublecheck", gpmEmail);
		System.out.println("isExist: 받은 정보: " + gpmEmail + " // 출력 정보: " + result);
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public boolean login(String email, String pwd) { // login
		if (isExist(email)) {
			System.out.println("login: 받은 email: " + email + " // 받은 pwd: " + pwd);
			System.out.println("login: database 내 해당 email 정보 존재");
			String originpwd = getSqlSession().selectOne("loginhelper", email);
			System.out.println("login: 데이터베이스 pwd " + originpwd);
			if (originpwd.equals(pwd)) {
				System.out.println("login: 성공");
				return true;
			} else {
				System.out.println("login: 실패 (pwd 오류)");
				return false;
			}

		} else {
			System.out.println("login: 실패 (입력된 email 정보 없음)");
			return false;
		}

	}

	@Override
	public String getNick(String email) {
		// 이메일을 통해 닉네임 얻기
		return getSqlSession().selectOne("getnickbyemail", email);
	}

}
