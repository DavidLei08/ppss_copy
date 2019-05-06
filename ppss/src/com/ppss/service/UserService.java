package com.ppss.service;

import java.util.List;

import com.ppss.model.UserModel;

public interface UserService {

	/**
	 * 取得用户管理的初始化信息
	 * @return
	 */
	public List<UserModel> userInit();
	
	/**
	 * 按条件检索用户信息
	 * @param userModel
	 * @return
	 */
	public List<UserModel> userSearch(UserModel userModel);

	/**
	 * 查询一条用户记录
	 * @param userId
	 * @return
	 */
	public UserModel findOneUser(String userId);
	
	/**
	 * 用户信息添加
	 * @param userModel
	 */
	public  void userAdd(UserModel userModel);
	
	/**
	 * 用户信息更新
	 * @param userModel
	 */
	public void userUpdate(UserModel userModel);
	
	/**
	 * 用户信息删除
	 * @param userId
	 */
	public void userDel(String userId);
	
}
