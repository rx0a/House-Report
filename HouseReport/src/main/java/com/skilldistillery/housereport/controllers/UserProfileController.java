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

import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.data.AddressDAO;
import com.skilldistillery.housereport.data.ListingDAO;
import com.skilldistillery.housereport.data.UserDAO;
import com.skilldistillery.housereport.entities.Address;
import com.skilldistillery.housereport.entities.Listing;
import com.skilldistillery.housereport.entities.User;

@Controller
public class UserProfileController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;
	@Autowired
	private ListingDAO listingDao;

	@RequestMapping(path = { "profile.do" }, method = RequestMethod.GET)
	public ModelAndView profile(HttpSession session) {
		User user2 = (User) session.getAttribute("user");
		session.setAttribute("user", userDao.findById(user2.getId()));
		String userRole = user2.getRole();
		ModelAndView mv = new ModelAndView();
		System.out.println(userRole);
//		List<Listing> loggedInUserListings = user2.getListings();
//		for (Listing listing : loggedInUserListings) {
//			listingDao.updateRating(listing.getId());
//		}
		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "getUser.do", params = "keyword", method = RequestMethod.POST)
	public ModelAndView getUser(String keyword, Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user2 = (User) session.getAttribute("user");
		String userRole = user2.getRole();
		model.addAttribute("userList", userDao.find(keyword));
		if (userRole.equals("admin")) {
			mv.addObject("allUserList", userDao.displayUsers());
			mv.addObject("listingList", listingDao.displayListings());
			mv.setViewName("admin");
			return mv;
		} else {
			mv.setViewName("userProfile");
			return mv;
		}
	}

	@RequestMapping(path = "getListing.do", params = "keyword", method = RequestMethod.POST)
	public ModelAndView getListing(String keyword, Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user2 = (User) session.getAttribute("user");
		String userRole = user2.getRole();
		List<Address> addresses = addressDao.findAddress(keyword);
		model.addAttribute("AddressList", addresses);
		if (userRole.equals("admin")) {
			mv.addObject("allUserList", userDao.displayUsers());
			mv.addObject("listingList", listingDao.displayListings());
			mv.setViewName("admin");
			return mv;
		} else {
			mv.addObject("listingList", listingDao.displayListings());
			mv.setViewName("userProfile");
			return mv;
		}
	}

	@RequestMapping(path = { "admin.do" }, method = RequestMethod.GET)
	public ModelAndView admin(HttpSession session) {
		User user2 = (User) session.getAttribute("user");
		String userRole = user2.getRole();
		ModelAndView mv = new ModelAndView();
		System.out.println(userRole);
		if (userRole.equals("admin")) {
			mv.addObject("allUserList", userDao.displayUsers());
			mv.addObject("listingList", listingDao.displayListings());
			mv.setViewName("admin");
			return mv;
		} else {
			mv.setViewName("userProfile");
			return mv;
		}
	}

	@RequestMapping(path = { "updateUser.do" }, params = { "id", "username", "password", "firstname", "lastname",
			"email" }, method = RequestMethod.POST)
	public String updateUser(int id, String username, String password, String firstname, String lastname, String email,
			HttpSession session) {
		System.out.println(id);
		User dbUser = userDao.findById(id);
		dbUser.setUsername(username);
		dbUser.setPassword(password);
		dbUser.setFirstName(firstname);
		dbUser.setLastName(lastname);
		dbUser.setEmail(email);
		userDao.updateUser(dbUser);
		session.setAttribute("user", dbUser);
		LocalDateTime updateTime = LocalDateTime.now();
		dbUser.setUpdatedTime(updateTime);
//		LocalDateTime now = LocalDateTime.now();
//		dbUser.setUpdatedTime(Duration.between(updateTime, now));
//		session.setAttribute("updateTime", updateTime);
//		model.addAttribute("user", dbUser);

		return "userProfile";
	}

	@RequestMapping(path = { "deleteUser.do" }, params = "id", method = RequestMethod.POST)
	public String deleteUser(int id) {
		User user = userDao.findById(id);
		userDao.deleteUser(user);
		return "admin";
	}

	@RequestMapping(path = { "editUserPage.do" }, params = "id", method = RequestMethod.POST)
	public String editUserPage(Model model, int id) {
		User user = userDao.findById(id);
//		model.addAttribute("user", user);
		return "editUser";
	}

	@RequestMapping(path = { "deactivateUser.do" }, method = RequestMethod.POST)
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

	@RequestMapping(path = { "activateUser.do" }, method = RequestMethod.POST)
	public String activateUser(User user) {
		
		System.out.println(user.getId());
		ModelAndView mv = new ModelAndView();
		User dbUser = userDao.findById(user.getId());
		
		System.out.println(dbUser);
		
		System.out.println(dbUser.getEnabled());
		userDao.activateUser(dbUser);
		System.out.println(dbUser.getEnabled());
//		mv.addObject("disabledUser", dbUser);
		mv.setViewName("userProfile");
		return "redirect:profile.do";
	}
}