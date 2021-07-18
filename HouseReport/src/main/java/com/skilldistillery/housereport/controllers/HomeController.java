package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
//	@RequestMapping(path= {"home.do"})
//	public String home(Model model) {
//		model.addAttribute("DEBUG", userDao.findById(1));
//		return "home";
//	}
	@RequestMapping(path = { "home.do"})
	public ModelAndView profile(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}

}
