package com.ppss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppss.dao.UserDao;
import com.ppss.model.UserModel;
import com.ppss.utils.MathHelp;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
   private UserDao userDao;
	
	@Override
	public UserModel loginAuth(UserModel userModel) {
		
		return userDao.loginAuth(userModel);
	}

	@Override
	public void userRegsiter(UserModel userModel) {
		userModel.setUserId(MathHelp.getNumId());
		userModel.setStatus(1);
		userDao.add(userModel);
	}

}
