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
	
	@RequestMapping(path = {"updateUser.do"},  params = { "id", "username", "password", "firstname", "lastname", "email"}, method = RequestMethod.POST)
	public String updateUser(Model model, int id, String username, String password, String firstname, String lastname, String email) {
		int enabled = 1;
		String role = "user";
		User user = new User(id, username, password, enabled, role, firstname, lastname, email);
		userDao.updateUser(user);
		model.addAttribute("user", user);
		return "userProfile";
	}
	
	@RequestMapping(path = {"deleteUser.do"}, params = "id")
	public String deleteUser(int id) {
		User user = userDao.findById(id);
		userDao.deleteUser(user);
		return "userProfile";
	}
	
	@RequestMapping(path = {"editUserPage.do"}, params = "id", method = RequestMethod.POST)
	public String editUserPage(Model model, int id) {
		User user = userDao.findById(id);
		model.addAttribute("user", user);
		return "editUser";
	}
}
