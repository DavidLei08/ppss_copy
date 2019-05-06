package com.ppss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppss.dao.UserDao;
import com.ppss.model.UserModel;
import com.ppss.utils.MathHelp;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<UserModel> userInit() {
		UserModel userModel=new UserModel();
		return userDao.findByCondition(userModel);
	}

	@Override
	public List<UserModel> userSearch(UserModel userModel) {
		return userDao.findByCondition(userModel);
	}

	@Override
	public void userAdd(UserModel userModel) {
		userModel.setStatus(1);
		userModel.setUserId(MathHelp.getNumId());
		userDao.add(userModel);
	}

	@Override
	public void userUpdate(UserModel userModel) {
		userModel.setStatus(1);
		userDao.update(userModel);
	}

	@Override
	public void userDel(String userId) {
		userDao.del(userId);
	}

	@Override
	public UserModel findOneUser(String userId) {
		return userDao.findOne(userId);
	}

}
