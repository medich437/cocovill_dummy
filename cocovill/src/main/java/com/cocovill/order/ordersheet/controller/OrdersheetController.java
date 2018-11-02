package com.cocovill.order.ordersheet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.dto.OrdersheetDto;
import com.cocovill.order.ordersheet.service.OrdersheetService;
import com.cocovill.order.utils.CommonUtil;
import com.cocovill.order.utils.PagingView;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/ordersheet")
public class OrdersheetController {

	private static final Logger logger = LoggerFactory.getLogger(OrdersheetController.class);
	
	@Resource(name="ordersheetService")
	private OrdersheetService ordersheetService;
	
	@RequestMapping(value="/ordersheetList")
	public ModelAndView ordersheetList(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<OrdersheetDto> resultList = null;
		resultList = ordersheetService.ordersheetList(ordersheetDto);
		
		if(resultList.size() > 0){
			//paging		
			OrdersheetDto pg = resultList.get(0);
			PagingView pv = new PagingView(pg.getPageNum(), ordersheetDto.getPageSize(), ordersheetDto.getBlockSize(), pg.getTotCnt());
			mav.addObject("paging", pv.print());
			//paging		
		}
		
		logger.info("getSearchFromDt:"+ordersheetDto.getSearchFromDt());
		logger.debug("getSearchToDt:"+ordersheetDto.getSearchToDt());
		logger.debug("ordersheetDto:"+ordersheetDto.toString());
		
		mav.addObject("paramDto", ordersheetDto);
		mav.addObject("resultList", resultList);
		
		mav.setViewName("/ordersheet/ordersheetList");
		
		return mav;
	}
	
	@RequestMapping(value="/ordersheetDetail")
	public ModelAndView ordersheetDetail(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ordersheet/ordersheetDetail");
		OrdersheetDto result = null;
		
		try {
			//게시글정보
			result = ordersheetService.ordersheetDetail(ordersheetDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("paramDto", ordersheetDto);
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value="/ordersheetDetailLayer")
	@ResponseBody
	public ModelAndView ordersheetDetailLayer(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ordersheet/ordersheetDetailLayer");
		OrdersheetDto result = null;
		
		try {
			//게시글정보
			result = ordersheetService.ordersheetDetail(ordersheetDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value="/ordersheetForm")
	public ModelAndView ordersheetForm(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/ordersheet/ordersheetForm");
		
		OrdersheetDto result = ordersheetService.ordersheetDetail(ordersheetDto);
		
		mav.addObject("paramDto", ordersheetDto);
		mav.addObject("result", result);
		return mav;
	}	
	
	@RequestMapping(value="/ordersheetInsert")
	public ModelAndView ordersheetInsert(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setInUserInfo(request, ordersheetDto);		
			CommonUtil.setUpUserInfo(request, ordersheetDto);
			json = ordersheetService.ordersheetInsert(ordersheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/ordersheet/ordersheetList.do");
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info("EXCEPTION insert E:" + e.toString());
			CommonUtil.getReturnCodeFail(json);
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/ordersheetUpdate")
	public ModelAndView ordersheetUpdate(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			
			//사용자정보
			CommonUtil.setUpUserInfo(request, ordersheetDto);
			json = ordersheetService.ordersheetUpdate(ordersheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
//			json.put("goUrl", "/ordersheet/detail.do?board_id="+ordersheetDto.getBoard_id() + "&board_gbn=" + ordersheetDto.getBoard_gbn());
			json.put("goUrl", "/ordersheet/ordersheetList.do");
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info("EXCEPTION insert E:" + e.toString());
			CommonUtil.getReturnCodeFail(json);
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/ordersheetDelete")
	@ResponseBody
	public ModelAndView ordersheetDelete(@ModelAttribute OrdersheetDto ordersheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, ordersheetDto);			
			json = ordersheetService.ordersheetDelete(ordersheetDto, request);
			CommonUtil.getReturnCodeSuc(json);
			json.put("goUrl", "/ordersheet/ordersheetList.do");
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("PROGRAM_Exception:"+e);
			CommonUtil.getReturnCodeFail(json);
		}
		
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
}