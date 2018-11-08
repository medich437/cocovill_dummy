package com.cocovill.order.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.UserDto;


@Repository("userDAO")
public class UserDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<UserDto> userList(UserDto userDto){
		return (List<UserDto>)selectList("user.userList", userDto);
	}
	
	public UserDto userDetail(UserDto userDto){
		return (UserDto) selectOne("user.userDetail", userDto);
	}

	public void userInsert(UserDto userDto){
		insert("user.userInsert", userDto);
	}
	
	public UserDto userDupCheck(UserDto userDto){
		return (UserDto) selectOne("user.userDupCheck", userDto);
	}

	public void userUpdate(UserDto userDto){
		update("user.userUpdate", userDto);
	}

	public void userDelete(UserDto userDto){
		update("user.userDelete", userDto);
	}
	
	public UserDto userLogin(UserDto userDto){
		return (UserDto) selectOne("user.userLogin", userDto);
	}
	
	public void userLoginUpdate(UserDto userDto){
		update("user.userLoginUpdate", userDto);
	}
	
}
