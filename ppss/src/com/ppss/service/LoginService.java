package com.ppss.service;

import com.ppss.model.UserModel;

/**
 * 用户登录用service
 * @author Administrator
 *
 */
public interface LoginService {

	/**
	 * 用户登录认证
	 * @param userModel
	 * @return
	 */
	public UserModel loginAuth(UserModel userModel);
	
	/**
	 * 用户注册
	 * @param userModel
	 */
	public void userRegsiter(UserModel userModel);
	
}
