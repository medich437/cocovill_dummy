package com.cocovill.order.uploadSheet.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.UploadSheetDto;

import net.sf.json.JSONObject;



public interface UploadSheetService {
	
	public List<UploadSheetDto> uploadSheetList(UploadSheetDto uploadSheetDto);
	public UploadSheetDto uploadSheetDetail(UploadSheetDto uploadSheetDto);
	public JSONObject uploadSheetInsert(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject uploadSheetUpdate(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject uploadSheetDelete(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public String getSeq(HashMap<String, String> map);
	
}
