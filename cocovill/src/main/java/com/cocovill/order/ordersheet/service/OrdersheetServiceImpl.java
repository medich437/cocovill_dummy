package com.cocovill.order.ordersheet.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cocovill.order.dto.OrdersheetDto;
import com.cocovill.order.ordersheet.dao.OrdersheetDAO;

import net.sf.json.JSONObject;


@Service("ordersheetService")
public class OrdersheetServiceImpl implements OrdersheetService{

	private static final Logger logger = LoggerFactory.getLogger(OrdersheetServiceImpl.class);
	
	@Resource(name="ordersheetDAO")
	private OrdersheetDAO ordersheetDAO;

	@Value("#{config['TABLESC']}") String TABLESC;
	@Value("#{config['TABLE_T_BOOTSTRAP']}") String TABLE_T_BOOTSTRAP;
	
	@Override
	public List<OrdersheetDto> ordersheetList(OrdersheetDto ordersheetDto){
		return ordersheetDAO.ordersheetList(ordersheetDto);
	}
	
	@Override
	public OrdersheetDto ordersheetDetail(OrdersheetDto ordersheetDto){
		return (OrdersheetDto) ordersheetDAO.ordersheetDetail(ordersheetDto);
	}

	@Override
	public JSONObject ordersheetInsert(OrdersheetDto ordersheetDto, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		String autoSeq = "";
		//BOARD autoincre 값 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableSC", TABLESC);
		map.put("tableNM", TABLE_T_BOOTSTRAP);
		
		autoSeq = ordersheetDAO.getSeq(map);		
		ordersheetDAO.ordersheetInsert(ordersheetDto);
		
		//화면단에 넘겨줌
		json.put("autoSeq", autoSeq);
		
		return json;
	}

	@Override
	public JSONObject ordersheetUpdate(OrdersheetDto ordersheetDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		ordersheetDAO.ordersheetUpdate(ordersheetDto);
		
		return json;
	}

	@Override
	public JSONObject ordersheetDelete(OrdersheetDto ordersheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		ordersheetDAO.ordersheetDelete(ordersheetDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return ordersheetDAO.getSeq(map);
	}

}
