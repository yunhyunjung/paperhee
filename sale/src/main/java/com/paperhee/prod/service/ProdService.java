package com.paperhee.prod.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paperhee.prod.service.impl.ProdMapper;

@Service
public class ProdService {

	@Autowired
	ProdMapper prodMapper;

	public List<Map<String, Object>> selectList(Map<String, Object> paramMap){
		List<Map<String,Object>> resultList = prodMapper.selectList(paramMap);
		return resultList;
	}

	public Object selectProd(Map<String, Object> paramMap) {
		return prodMapper.selectProd(paramMap);
	}

	public int insertProd(Map<String, Object> paramMap) {
		return prodMapper.insertProd(paramMap);
	}

	public int updateProd(Map<String, Object> paramMap) {
		return prodMapper.updateProd(paramMap);
	}

	public int deleteProd(Map<String, Object> paramMap) {
		return prodMapper.deleteProd(paramMap);
	}
}
