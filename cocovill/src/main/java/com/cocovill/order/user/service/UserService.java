package com.cocovill.order.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.UserDto;

import net.sf.json.JSONObject;



public interface UserService {
	
	/**
	 * 사용자 리스트
	 * @param userDto
	 * @return
	 */
	public List<UserDto> userList(UserDto userDto);
	
	/**
	 * 사용자상세
	 * @param userDto
	 * @return
	 */
	public UserDto userDetail(UserDto userDto);
	
	/**
	 * 사용자등록
	 * @param userDto
	 * @param request
	 * @return
	 */
	public JSONObject userInsert(UserDto userDto, HttpServletRequest request);
	
	/**
	 * 아이디 중복체크
	 * @param userDto
	 * @return
	 */
	public UserDto userDupCheck(UserDto userDto);
	
	/**
	 * 사용자 업데이트
	 * @param userDto
	 * @param request
	 * @return
	 */
	public JSONObject userUpdate(UserDto userDto, HttpServletRequest request);
	
	/**
	 * 사용자 탈퇴
	 * @param userDto
	 * @param request
	 * @return
	 */
	public JSONObject userDelete(UserDto userDto, HttpServletRequest request);
	
	/**
	 * 로그인
	 * @param userDto
	 * @return
	 */
	public UserDto userLogin(UserDto userDto);
	
	/**
	 * 로그인시 정보 업데이트
	 * @param userDto
	 * @param request
	 * @return
	 */
	public JSONObject userLoginUpdate(UserDto userDto, HttpServletRequest request);
	
}
