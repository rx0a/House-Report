package com.skilldistillery.housereport.controllers;

import javax.servlet.http.HttpSession;

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


	@RequestMapping(path = { "profile.do" }, method = RequestMethod.GET)
	public ModelAndView profile(HttpSession session) {
		User user2 = (User)session.getAttribute("user");
		String userRole = user2.getRole();
		ModelAndView mv = new ModelAndView();
		System.out.println(userRole);
		if(userRole.equals("admin")) {
			mv.addObject("userList", userDao.displayUsers());
		}
		mv.setViewName("userProfile");
		return mv;
	}
	
	@RequestMapping(path = {"updateUser.do"},  params = { "id", "username", "password", "firstname", "lastname", "email"}, method = RequestMethod.POST)
	public String updateUser(Model model, int id, String username, String password, String firstname, String lastname, String email) {
		User dbUser = userDao.findById(id);
		dbUser.setUsername(username);
		dbUser.setPassword(password);
		dbUser.setFirstName(firstname);
		dbUser.setLastName(lastname);
		dbUser.setEmail(email);
		userDao.updateUser(dbUser);
//		model.addAttribute("user", dbUser);
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
//		model.addAttribute("user", user);
		return "editUser";
	}
	
	@RequestMapping(path = {"deactivateUser.do"}, method = RequestMethod.POST)
	public String deactivateUser(User user) {
		
		System.out.println(user.getId());
		ModelAndView mv = new ModelAndView();
		User dbUser = userDao.findById(user.getId());
		
		System.out.println(dbUser);
		
		System.out.println(dbUser.getEnabled());
		userDao.deactivateUser(dbUser);
		System.out.println(dbUser.getEnabled());
//		mv.addObject("disabledUser", dbUser);
		mv.setViewName("userProfile");
		return "redirect:profile.do";
	}
	
	
}
