package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.User;

@Controller
public class LoginController {
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "login.do" })
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(path = { "checkAccount.do" }, params = { "username", "password" }, method = RequestMethod.POST)
	public ModelAndView checkAccount(Model model, String username, String password) {
		ModelAndView mv = new ModelAndView();
		if (userDao.checkUsername(username)) {
			User user = userDao.findByUsername(username);		
			mv.addObject("user", user);
			mv.setViewName("home");
			return mv;
		}
		else {
			mv.setViewName("register");
			return mv;
		}
	}
}
