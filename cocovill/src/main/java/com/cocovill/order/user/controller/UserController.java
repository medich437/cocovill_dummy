package com.cocovill.order.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.dto.UserDto;
import com.cocovill.order.user.service.UserService;
import com.cocovill.order.utils.CommonUtil;
import com.cocovill.order.utils.PagingView;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@Value("#{config['ADMIN_ID']}") String ADMIN_ID;
	
	@Value("#{msgconfig['EXCEPTION_MSG']}") String EXCEPTION_MSG;
	@Value("#{msgconfig['USER_MSG01']}") String USER_MSG01;
	@Value("#{msgconfig['USER_MSG02']}") String USER_MSG02;
	@Value("#{msgconfig['LOGIN_MSG01']}") String LOGIN_MSG01;
	@Value("#{msgconfig['LOGIN_MSG02']}") String LOGIN_MSG02;
	@Value("#{msgconfig['LOGIN_MSG03']}") String LOGIN_MSG03;
	
	
	/**
	 * 사용자리스트
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userList")
	public ModelAndView userList(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<UserDto> resultList = null;
		resultList = userService.userList(userDto);
		
		if(resultList.size() > 0){
			//paging		
			UserDto pg = resultList.get(0);
			PagingView pv = new PagingView(pg.getPageNum(), userDto.getPageSize(), userDto.getBlockSize(), pg.getTotCnt());
			mav.addObject("paging", pv.print());
			//paging		
		}
		
		mav.addObject("paramDto", userDto);
		mav.addObject("resultList", resultList);
		
		mav.setViewName("/user/userList");
		
		return mav;
	}
	
	/**
	 * 사용자상세
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userDetail")
	public ModelAndView userDetail(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/userDetail");
		UserDto result = null;
		
		result = userService.userDetail(userDto);
		
		mav.addObject("paramDto", userDto);
		mav.addObject("result", result);
		
		return mav;
	}
	

	/**
	 * 사용자 등록폼
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userForm")
	public ModelAndView userForm(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/user/userForm");
		
		UserDto result = userService.userDetail(userDto);
		
		mav.addObject("paramDto", userDto);
		mav.addObject("result", result);
		return mav;
	}	
	
	/**
	 * 사용자등록
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userInsert")
	public ModelAndView userInsert(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			UserDto dupCheck = userService.userDupCheck(userDto);
			if(dupCheck != null) {
				CommonUtil.getReturnCodeFail(json, USER_MSG02);
				mav.addObject("resultJson", json);
				return mav;
			}
			
			json = userService.userInsert(userDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/user/userList.do");
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info(EXCEPTION_MSG + e.toString());
			CommonUtil.getReturnCodeFail(json, e.toString());
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	/**
	 * 사용자 업데이트
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userUpdate")
	public ModelAndView userUpdate(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			
			//사용자정보
			json = userService.userUpdate(userDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
//			json.put("goUrl", "/user/detail.do?board_id="+userDto.getBoard_id() + "&board_gbn=" + userDto.getBoard_gbn());
			json.put("goUrl", "/user/userList.do");
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
	
	/**
	 * 사용자 탈퇴
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userDelete")
	public ModelAndView userDelete(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		// admin  삭제안됨
		if(userDto.getUser_id().equals(ADMIN_ID)) {
			CommonUtil.getReturnCodeFail(json, USER_MSG01);
		}else {
			try {
				//사용자정보
				json = userService.userDelete(userDto, request);
				CommonUtil.getReturnCodeSuc(json);
				json.put("goUrl", "/user/userList.do");
			} catch (Exception e) {
				// TODO: handle exception
				logger.info(EXCEPTION_MSG+e);
				CommonUtil.getReturnCodeFail(json);
			}
		}
		
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	
	@RequestMapping(value="/userLogin")
	public ModelAndView userLogin(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		UserDto result = userService.userLogin(userDto);
		
		if(result == null) {
			CommonUtil.getReturnCodeFail(json, LOGIN_MSG02);
		}else {
			// 로그인 성공 최근 로그인일 및 최근로그인IP 업데이트
			try {
				userService.userLoginUpdate(userDto, request);
			}catch (Exception e) {
				e.printStackTrace();
				logger.info(EXCEPTION_MSG+"로그인 성공 최근 로그인일 및 최근로그인IP 업데이트");
			}
			
			CommonUtil.getReturnCodeSuc(json, LOGIN_MSG01);
			json.put("goUrl", "/uploadSheet/uploadSheetList.do");
			session.setAttribute("USER_ID", userDto.getUser_id());
		}
		
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/userLogout")
	public ModelAndView userLogout(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		
		//저장후 페이지 이동
		CommonUtil.getReturnCodeSuc(json, LOGIN_MSG03);
		json.put("goUrl", "/user/userLoginForm.do");
		session.invalidate();
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/userLoginForm")
	public ModelAndView userLoginForm(@ModelAttribute UserDto userDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/userLoginForm");
		mav.addObject("paramDto", userDto);
		return mav;
	}
	
}