package com.skilldistillery.housereport.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.User;

@Controller
public class LoginController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;

	@RequestMapping(path = { "/", "login.do" })
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(path = { "user.do" })
	public String user(Model model) {
		return "user";
	}

	@RequestMapping(path = { "checkAccount.do" }, params = { "username", "password" }, method = RequestMethod.POST)
	public ModelAndView checkAccount(Model model, String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = userDao.findByUsername(username);
		if (user.getEnabled() == 1) {
			if (userDao.checkUsername(username)) {
				if (user.getPassword().equals(password)) {
					session.setAttribute("user", user);
					List<Address> addresses = addressDao.findAddress("");
					model.addAttribute("AddressList", addresses);
					mv.setViewName("home");
					LocalDateTime lt = LocalDateTime.now();
					session.setAttribute("loginTime", lt);
					return mv;
				} else {
					mv.clear();
					mv.setViewName("login");
					return mv;
				}
			} else {
				mv.clear();
				mv.setViewName("register");
				return mv;
			}
		} else {
			mv.clear();
			boolean accountDisabled = true;
			model.addAttribute("accountDisabled", accountDisabled);
			mv.setViewName("login");
			return mv;
		}
	}

	@RequestMapping(path = { "logOut.do" }, method = RequestMethod.GET)
	public ModelAndView logOut(HttpSession session) {
		User user2 = (User) session.getAttribute("user");
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user");
		mv.setViewName("login");
		return mv;
	}
}
