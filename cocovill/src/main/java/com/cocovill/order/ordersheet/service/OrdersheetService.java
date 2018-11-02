package com.cocovill.order.ordersheet.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.OrdersheetDto;

import net.sf.json.JSONObject;



public interface OrdersheetService {
	
	public List<OrdersheetDto> ordersheetList(OrdersheetDto ordersheetDto);
	public OrdersheetDto ordersheetDetail(OrdersheetDto ordersheetDto);
	public JSONObject ordersheetInsert(OrdersheetDto ordersheetDto, HttpServletRequest request);
	public JSONObject ordersheetUpdate(OrdersheetDto ordersheetDto, HttpServletRequest request);
	public JSONObject ordersheetDelete(OrdersheetDto ordersheetDto, HttpServletRequest request);
	public String getSeq(HashMap<String, String> map);
	
}
