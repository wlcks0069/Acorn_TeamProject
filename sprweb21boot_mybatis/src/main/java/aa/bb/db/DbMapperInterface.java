package aa.bb.db;

import java.util.List;

public interface DbMapperInterface {
	public List<SangpumDto> getList() throws Exception;	//mapper의 요소 id와 같아야함
}
