package com.ppss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppss.model.UserModel;
import com.ppss.service.LoginService;

/**
 * PPSS系统登录的前端控制
 * 
 * @author ZXM
 *
 */
@RequestMapping("/auth")
@Controller
public class LoginController {

	/**
	 * 登录用service
	 */
	@Autowired
	private LoginService loginService;

	/**
	 * 登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String LoginPage() {
		return "login";
	}

	/**
	 * 注册页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/regsiter", method = RequestMethod.GET)
	public String UserRegsiter() {
		return "userregsiter";
	}

	/**
	 * 提交注册信息
	 * 
	 * @param userModel
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/regsiter", method = RequestMethod.POST)
	public String doUserRegsiter(UserModel userModel, RedirectAttributes redirectAttributes) {
		try {
			loginService.userRegsiter(userModel);
			String sucessMessage = "用户注册成功";
			redirectAttributes.addFlashAttribute("sucessMessage", sucessMessage);
		} catch (Exception e) {
			String message = "状态异常，用户注册失败";
			redirectAttributes.addFlashAttribute("message", message);
		}
		return "redirect:/auth/login";
	}

	/**
	 * 提交登录信息进行认证
	 * 
	 * @param userModel
	 * @param session
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String LoginAuth(UserModel userModel, HttpSession session, RedirectAttributes redirectAttributes) {
		// 用户登录信息认证
		UserModel sessionUser = loginService.loginAuth(userModel);
		// 判断认证后取得用户信息不为空
		if (sessionUser != null) {
			// 用户信息存入session
			session.setAttribute("user", sessionUser);
			// 判断用户角色，若取得为0，跳转管理页面，否则跳转普通用户页面
			if (sessionUser.getStatus() == 0) {

				return "managerframe";
			} else {
				return "simpleframe";
			}

		}
		// 定义登录失败的信息
		String message = "用户名或密码错误，请重试";
		// 暂存信息
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/auth/login";
	}

	/**
	 * 退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logOut(HttpSession session) {
		// 销毁当前session，生成新的session
		session.invalidate();

		return "redirect:/auth/login";
	}

}
