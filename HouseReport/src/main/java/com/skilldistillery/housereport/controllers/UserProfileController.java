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
public class UserProfileController {
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "profile.do" }, method = RequestMethod.POST)
	public ModelAndView profile(User user) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", userDao.findById(user.getId()));
		mv.setViewName("userProfile");
		return mv;
	}
}
