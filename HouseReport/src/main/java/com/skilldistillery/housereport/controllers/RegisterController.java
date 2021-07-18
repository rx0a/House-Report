package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.housereport.data.UserDAO;

@Controller
public class RegisterController {
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "register.do" })
	public String login(Model model) {
		return "register";
	}

	@RequestMapping(path = { "register.do" }, params = { "username", "password", "enabled", "role", "firstName",
			"lastName", "email" }, method = RequestMethod.POST)
	public String login(Model model, String username, String password, boolean enabled, String role, String firstName,
			String lastName, String email) {
		// ------------------------------//
		// Create a new user right here //
		// ------------------------------//
		return "register";
	}
}
