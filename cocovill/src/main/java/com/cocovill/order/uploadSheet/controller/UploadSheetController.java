package com.cocovill.order.uploadSheet.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.uploadSheet.service.UploadSheetService;
import com.cocovill.order.utils.excel.ExcelRead;
import com.cocovill.order.utils.excel.ExcelReadOption;

@Controller
@RequestMapping(value="/uploadSheet")
public class UploadSheetController {

	private static final Logger logger = LoggerFactory.getLogger(UploadSheetController.class);
	
	@Resource(name="uploadSheetService")
	private UploadSheetService uploadSheetService;
	
	@RequestMapping(value = "/uploadSheetList")
	public ModelAndView excelUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/uploadSheet/uploadSheetList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/excelUploadAjax", method = RequestMethod.POST)
	public ModelAndView excelUploadAjax(MultipartHttpServletRequest request) throws Exception {
		MultipartFile excelFile = request.getFile("excelFile");
		System.out.println("엑셀 파일 업로드 컨트롤러");
		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		}

		File destFile = new File("D:\\" + excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		// Service 단에서 가져온 코드
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A", "B", "C", "D", "E", "F");
		excelReadOption.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);

		for (Map<String, String> article : excelContent) {
			System.out.println(article.get("A"));
			System.out.println(article.get("B"));
			System.out.println(article.get("C"));
			System.out.println(article.get("D"));
			System.out.println(article.get("E"));
			System.out.println(article.get("F"));
		}

		// userService.excelUpload(destFile); //서비스 부분을 삭제한다.

		// FileUtils.forceDelete(destFile.getAbsolutePath());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/uploadSheet/excelUploadView");
		mav.addObject("resultList", excelContent);
		return mav;
	}
	
}