package com.skilldistillery.housereport.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.housereport.data.UserDAO;
@Controller
public class ResultsController {
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "results.do" })
	public String showResults(Model model) {
		return "results";
	}
}
