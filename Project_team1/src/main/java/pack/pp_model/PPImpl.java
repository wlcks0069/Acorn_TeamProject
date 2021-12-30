package pack.pp_model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.mc_controller.MCBoardBean;

@Repository
public class PPImpl extends SqlSessionDaoSupport implements PPInter{
	@Autowired
	public PPImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<PPDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PPDto> getSearch(PPDto bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PPDto getDetail(int selectedContentNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean ppWrite(MCBoardBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mcUpdate(MCBoardBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mcDelete(int selectedContentNumber) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mcLikeCount(int selectedContentNumber) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mcCommentCount(int selectedContentNumber) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mcComment(MCBoardBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int currentMaxnum() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String securecodeforUporDel(int selectedContentNumber) {
		// TODO Auto-generated method stub
		return null;
	}
}
