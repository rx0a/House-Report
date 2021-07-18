package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.User;

@Controller
public class RegisterController {
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "register.do" })
	public String login(Model model) {
		return "register";
	}

	@RequestMapping(path = "registerUser.do",
			        method = RequestMethod.POST)
	public String login(User user, String passwordverify, RedirectAttributes redir) {
		System.out.println("------------------------------------TEST----------------------------");
		System.out.println(passwordverify);
		System.out.println(user.getUsername());
		System.out.println(user.getEnabled());
		System.out.println(user.getRole());
		System.out.println(userDao.checkUsername("admin"));
		if(!userDao.checkUsername(user.getUsername())) {
			if(user.getPassword().equals(passwordverify)) {
				userDao.createUser(user);
				return "redirect:home.do";
			}
			else {
				return "register";
			}
		} else {
			return "register";
		}
	}
}
