package aa.bb.db;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration	//DB 접속정보를 위한 어노테이션
@MapperScan(basePackages = "aa.bb.db")	//interface 위치
@EnableTransactionManagement	//TransactionManager를 적용할 것인지에 대한 어노테이션
public class DatabaseConfig {
	@Bean	//개발자가 직접 제어할 수 없는 외부 라이브러리를 객체로 만드는 경우 사용하는 어노테이션
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		final SqlSessionFactoryBean sessionFactory=new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		PathMatchingResourcePatternResolver resolver=new PathMatchingResourcePatternResolver();
		sessionFactory.setMapperLocations(resolver.getResources("classpath:mapper/*.xml"));
		return sessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception{
		final SqlSessionTemplate sessionTemplate=new SqlSessionTemplate(sqlSessionFactory);
		return sessionTemplate;
	}
}













