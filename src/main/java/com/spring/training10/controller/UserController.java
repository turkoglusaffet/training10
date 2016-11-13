package com.spring.training10.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.training10.entity.TblUser;
import com.spring.training10.jpa.UserRepository;



@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/user-list.html")
	public ModelAndView getUserList(ModelMap model, HttpServletRequest request) {
		System.out.println(request.getSession().getId());
		List<TblUser> tblUsers = userRepository.findAll();
		model.addAttribute("users", tblUsers);
		return new ModelAndView("userList", model);
	}

	@RequestMapping(value = "/save-user.html", method = RequestMethod.GET)
	public ModelAndView getUserSave(ModelMap model) {
		model.addAttribute("user", new TblUser());
		return new ModelAndView("saveUser", model);
	}

	@RequestMapping(value = "/save-user.html", method = RequestMethod.POST)
	public String postUserSave(@ModelAttribute("user") @Valid TblUser user, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "saveUser";
		}
		userRepository.insert(user);
		return "redirect:user-list.html";
	}

	@RequestMapping(value = "/edit-user-{userId}.html", method = RequestMethod.GET)
	public ModelAndView getUserEdit(@PathVariable("userId") int userId, ModelMap model) {
		TblUser user = userRepository.findById(userId);
		model.addAttribute("user", user);
		return new ModelAndView("editUser", model);
	}

	@RequestMapping(value = "/edit-user-{userId}.html", method = RequestMethod.POST)
	public String postUserEdit(@ModelAttribute("user") @Valid TblUser user, @PathVariable("userId") int userId,
			BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "editUser";
		}
		userRepository.update(user);
		return "redirect:user-list.html";
	}
	
}
