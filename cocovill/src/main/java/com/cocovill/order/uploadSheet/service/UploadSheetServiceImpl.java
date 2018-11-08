package com.cocovill.order.uploadSheet.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cocovill.order.dto.UploadSheetDto;
import com.cocovill.order.uploadSheet.dao.UploadSheetDAO;

import net.sf.json.JSONObject;


@Service("uploadSheetService")
public class UploadSheetServiceImpl implements UploadSheetService{

	private static final Logger logger = LoggerFactory.getLogger(UploadSheetServiceImpl.class);
	
	@Resource(name="uploadSheetDAO")
	private UploadSheetDAO uploadSheetDAO;

	@Value("#{config['TABLESC']}") String TABLESC;
	@Value("#{config['TABLE_T_BOOTSTRAP']}") String TABLE_T_BOOTSTRAP;
	
	@Override
	public List<UploadSheetDto> uploadSheetList(UploadSheetDto uploadSheetDto){
		return uploadSheetDAO.uploadSheetList(uploadSheetDto);
	}
	
	@Override
	public UploadSheetDto uploadSheetDetail(UploadSheetDto uploadSheetDto){
		return (UploadSheetDto) uploadSheetDAO.uploadSheetDetail(uploadSheetDto);
	}

	@Override
	public JSONObject uploadSheetInsert(UploadSheetDto uploadSheetDto, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		String autoSeq = "";
		//BOARD autoincre 값 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableSC", TABLESC);
		map.put("tableNM", TABLE_T_BOOTSTRAP);
		
		autoSeq = uploadSheetDAO.getSeq(map);		
		uploadSheetDAO.uploadSheetInsert(uploadSheetDto);
		
		//화면단에 넘겨줌
		json.put("autoSeq", autoSeq);
		
		return json;
	}

	@Override
	public JSONObject uploadSheetUpdate(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		uploadSheetDAO.uploadSheetUpdate(uploadSheetDto);
		
		return json;
	}

	@Override
	public JSONObject uploadSheetDelete(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		uploadSheetDAO.uploadSheetDelete(uploadSheetDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return uploadSheetDAO.getSeq(map);
	}

}
