package com.cocovill.order.ordersheet.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.OrdersheetDto;


@Repository("ordersheetDAO")
public class OrdersheetDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<OrdersheetDto> ordersheetList(OrdersheetDto ordersheetDto){
		return (List<OrdersheetDto>)selectList("ordersheet.ordersheetList", ordersheetDto);
	}
	
	public OrdersheetDto ordersheetDetail(OrdersheetDto ordersheetDto){
		return (OrdersheetDto) selectOne("ordersheet.ordersheetDetail", ordersheetDto);
	}

	public void ordersheetInsert(OrdersheetDto ordersheetDto){
		insert("ordersheet.ordersheetInsert", ordersheetDto);
	}

	public void ordersheetUpdate(OrdersheetDto ordersheetDto){
		update("ordersheet.ordersheetUpdate", ordersheetDto);
	}

	public void ordersheetDelete(OrdersheetDto ordersheetDto){
		update("ordersheet.ordersheetDelete", ordersheetDto);
	}
	
	public String getSeq(HashMap<String, String> map){
		return (String) selectOne("ordersheet.autoSeq", map);
	}
	
}
