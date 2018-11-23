package com.paperhee.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class DatabaseConfig {
 
	@Bean
	public SqlSessionFactory sqlSesstionFactory(DataSource datasource) throws Exception{
		SqlSessionFactoryBean sqlSesstionFactory = new SqlSessionFactoryBean();
		sqlSesstionFactory.setDataSource(datasource);
		sqlSesstionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mappers/*.xml"));
		
		return (SqlSessionFactory) sqlSesstionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
