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
	public List<MCBoardDto> getList() {
		
		List<MCBoardDto> list=new ArrayList<MCBoardDto>();
		
		//List<MCBoardDto> list=getSqlSession().selectList("getList");
		return list;
	}
	
	@Override
	public boolean mcWrite(MCBoardBean bean) {
		
		return false;
	}
}
