package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.User;

@Controller
public class UserProfileController {
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path= {"profile.do"})
	public String profile() {
//		model.addAttribute("user", user);
		return "userProfile";
	}

}
