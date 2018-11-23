package com.paperhee.prod.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paperhee.prod.service.ProdService;

@Controller
public class ProdController {

	final Logger logger = LoggerFactory.getLogger(ProdController.class);

	@Autowired
	ProdService prodService;

	@RequestMapping("/index")
	public String index() {
		return "/prod/list";
	}

	/**
	 * prod list를 출력
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/prod/list")
	public @ResponseBody Map<String,Object> selectList(@RequestBody Map<String,Object> paramMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> prodList = prodService.selectList(paramMap);
		resultMap.put("rows", prodList);
		return resultMap;
	}


	/**
	 * prod 1건을 조회한다.
	 * @param model
	 * @return
	 */
/*	@RequestMapping(value="/prod/view")
	public @ResponseBody Map<String,Object> selectProd(Model model, @RequestParam(value="prodCode", defaultValue="false") String prodCode) throws Exception {


		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("prodCode", prodCode);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		Object prod = prodService.selectProd(paramMap);
		resultMap.put("prod",prod);

		return resultMap;
	}*/

	/**
	 * prod 1건을 조회한다.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/view")
	public String selectProd(Model model, @RequestParam(value="prodCode", defaultValue="false") String prodCode) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("prodCode", prodCode);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Object prod = prodService.selectProd(paramMap);
		resultMap.put("prod",prod);
		model.addAttribute("prodVO", prod);
		return  "/prod/save";
	}

	/**
	 * Prod 1건을 등록한다
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prod/saveProd")
	public @ResponseBody Map<String,Object> insertProd(@RequestBody Map<String,Object> paramMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCount = 0;

		String prodCode = (String)paramMap.get("prodCode");
		if( prodCode != null && !"".equals(prodCode)) {
			resultCount = prodService.updateProd(paramMap);
		}else {
			resultCount = prodService.insertProd(paramMap);
			resultMap.put("prodCode", paramMap.get("prodCode"));
		}

		if( resultCount < 1) throw new Exception("");

		resultMap.put("result", "success");
		return  resultMap;
	}

	/**
	 * Prod 1건을 수정한다
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prod/deleteProd")
	public @ResponseBody Map<String,Object> deleteProd(@RequestBody List<Object> paramList) throws Exception {

		int resultCount = 0;

		if( !paramList.isEmpty()) {
			for(int i=0;i<paramList.size();i++) {
				Map<String, Object> map = (Map<String, Object>) paramList.get(i);
				resultCount = prodService.deleteProd(map);
			}
		}

		if( resultCount < 1) throw new Exception("");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		return  resultMap;
	}

}
