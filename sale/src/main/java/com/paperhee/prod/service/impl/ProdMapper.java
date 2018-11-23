package com.paperhee.prod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.paperhee.common.dao.AbstractDAO;

@Repository
public class ProdMapper extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectList(Map<String, Object> paramMap){
		return selectList("ProdMapper.selectListProd", paramMap);
	}

	public Object selectProd(Map<String, Object> paramMap) {
		return selectOne("ProdMapper.selectProd", paramMap);
	}

	public int insertProd(Map<String, Object> paramMap) {
		return (int) insert("ProdMapper.insertProd", paramMap);
	}

	public int updateProd(Map<String, Object> paramMap) {
		return (int) update("ProdMapper.updateProd", paramMap);
	}

	public int deleteProd(Map<String, Object> paramMap) {
		return (int) update("ProdMapper.deleteProd", paramMap);
	}

}
