package com.danai.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.danai.model.*;
import com.danai.repository.*;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("user",userDao.getUser(1));
		model.addAttribute("user4",userDao.getUser(2));
		model.addAttribute("user3",userDao.getUser(2));
		

		return "home";
	}
	
	
	@RequestMapping(value = "/list/user", method = RequestMethod.GET)
	public String listUser(Model model){
		
		model.addAttribute("listUser",userDao.getAllUser());
		return "home";
	}
}
