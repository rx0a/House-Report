package com.skilldistillery.housereport.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

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
	public ModelAndView checkAccount(Model model, String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (userDao.checkUsername(username)) {
			User user = userDao.findByUsername(username);
			if (user.getPassword().equals(password)) {
				// username and password is correct - going home
				mv.addObject("user", user);
				mv.setViewName("home");
				// session - add login time
				LocalDateTime lt = LocalDateTime.now();
				session.setAttribute("loginTime", lt);
				return mv;
			} else {
				// Wrong password - going back to login
				mv.clear();
				mv.setViewName("login");
				return mv;
			}
		} else {
			// No user with that username - going to register
			mv.clear();
			mv.setViewName("register");
			return mv;
		}
	}
}
