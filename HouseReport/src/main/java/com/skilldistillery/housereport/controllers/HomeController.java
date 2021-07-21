package com.skilldistillery.housereport.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.entities.Address;

@Controller
public class HomeController {

	@Autowired
	private AddressDAO addressDao;

	@RequestMapping(path = { "home.do" })
	public ModelAndView LetsGoHome(String keyword, Model model) {
		ModelAndView mv = new ModelAndView();
		List<Address> addresses = addressDao.findAddress(keyword);

		model.addAttribute("AddressList", addresses);
		mv.setViewName("home");
		return mv;
	}

}
