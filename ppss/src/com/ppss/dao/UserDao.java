package com.ppss.dao;

import java.util.List;

import com.ppss.model.UserModel;

public interface UserDao {

	public void add(UserModel userModel);
	public void update(UserModel userModel);
	public void del(String userId);
	public List<UserModel> findByCondition(UserModel userModel);
	public UserModel loginAuth(UserModel userModel);
	public UserModel findOne(String userId);
}
