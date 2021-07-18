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
	public String login(User user, String passwordverify, RedirectAttributes redir, Model model) {
		if(!userDao.checkUsername(user.getUsername())) {
			if(!userDao.checkEmail(user.getEmail())) {
				if(user.getPassword().equals(passwordverify)) {
					userDao.createUser(user);
					boolean creationSuccessful = true;
					redir.addFlashAttribute("creation", creationSuccessful);
					return "redirect:login.do";
				} else {
					boolean passwordMatch = true;
					model.addAttribute("password", passwordMatch);
					return "register";
				}
			} else {
				boolean foundEmail = true;
				model.addAttribute("email", foundEmail);
				return "register";
			}
		} else {
			boolean foundUsername = true;
			model.addAttribute("username", foundUsername);
			return "register";
		}
	}
}
