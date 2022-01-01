package pack.gpm_model;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

@Repository
public class DataSource extends DriverManagerDataSource{
	public DataSource() {
		setDriverClassName("oracle.jdbc.driver.OracleDriver");
		setUrl("jdbc:oracle:thin:@14.63.164.99:1521:xe");
		setUsername("scott01");
		setPassword("tiger01");
	}
}
