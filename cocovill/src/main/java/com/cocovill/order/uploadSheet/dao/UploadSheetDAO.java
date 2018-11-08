package com.cocovill.order.uploadSheet.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.UploadSheetDto;


@Repository("uploadSheetDAO")
public class UploadSheetDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<UploadSheetDto> uploadSheetList(UploadSheetDto uploadSheetDto){
		return (List<UploadSheetDto>)selectList("uploadSheet.uploadSheetList", uploadSheetDto);
	}
	
	public UploadSheetDto uploadSheetDetail(UploadSheetDto uploadSheetDto){
		return (UploadSheetDto) selectOne("uploadSheet.uploadSheetDetail", uploadSheetDto);
	}

	public void uploadSheetInsert(UploadSheetDto uploadSheetDto){
		insert("uploadSheet.uploadSheetInsert", uploadSheetDto);
	}

	public void uploadSheetUpdate(UploadSheetDto uploadSheetDto){
		update("uploadSheet.uploadSheetUpdate", uploadSheetDto);
	}

	public void uploadSheetDelete(UploadSheetDto uploadSheetDto){
		update("uploadSheet.uploadSheetDelete", uploadSheetDto);
	}
	
	public String getSeq(HashMap<String, String> map){
		return (String) selectOne("uploadSheet.autoSeq", map);
	}
	
}
