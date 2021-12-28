package aa.bb.db;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DbService {
	@Autowired
	private DbMapperInterface mapperInterface;
	
	public List<SangpumDto> getList() throws Exception{
		return mapperInterface.getList();
	}
}
