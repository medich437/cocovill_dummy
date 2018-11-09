package com.cocovill.order.user.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cocovill.order.dto.UserDto;
import com.cocovill.order.user.dao.UserDAO;
import com.cocovill.order.utils.CommonUtil;

import net.sf.json.JSONObject;


@Service("userService")
public class UserServiceImpl implements UserService{

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	@Override
	public List<UserDto> userList(UserDto userDto){
		return userDAO.userList(userDto);
	}
	
	@Override
	public UserDto userDetail(UserDto userDto){
		return (UserDto) userDAO.userDetail(userDto);
	}

	@Override
	public JSONObject userInsert(UserDto userDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		CommonUtil.setInUserInfo(request, userDto);
		userDAO.userInsert(userDto);
		return json;
	}

	@Override
	public UserDto userDupCheck(UserDto userDto){
		return (UserDto) userDAO.userDupCheck(userDto);
	}

	@Override
	public JSONObject userUpdate(UserDto userDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		CommonUtil.setUpUserInfo(request, userDto);
		userDAO.userUpdate(userDto);
		return json;
	}

	@Override
	public JSONObject userDelete(UserDto userDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		CommonUtil.setUpUserInfo(request, userDto);
		userDAO.userDelete(userDto);
		return json;
	}
	
	@Override
	public UserDto userLogin(UserDto userDto){
		return (UserDto) userDAO.userLogin(userDto);
	}
	
	@Override
	public JSONObject userLoginUpdate(UserDto userDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		CommonUtil.setUpUserInfo(request, userDto);
		userDAO.userLoginUpdate(userDto);
		return json;
	}

}
