package com.danai.app;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.danai.model.Category;
import com.danai.model.Location;
import com.danai.model.User;
import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LocationDao locationDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Map<String, Object> map) {
		
		return "danai";
	}
	
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(Model model,HttpServletRequest request){
		String param = (String)request.getParameter("s");
		System.out.println("+"+param+"+");
		if(param.trim().equals("")) return "redirect:/";
		model.addAttribute("res", param);
		model.addAttribute("projectsByUser",projectDao.getProjectSearchByUsername(param));
		model.addAttribute("projectsByTitle",projectDao.getProjectSearchByTitle(param));
		model.addAttribute("projectsByCategory",projectDao.getProjectSearchByCategory(param));
		return "search";
	}
	
	
	@RequestMapping(value="/user.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute User user, BindingResult result, @RequestParam String action, Map<String, Object> map) {
		User userResult = new User();
		String com =action.toLowerCase();
		if (com.equals("add")) {
			userDao.add(user);
			userResult = user;
		}
		if (com.equals("edit")) {
			userDao.edit(user);
			userResult = user;
		}
		if (com.equals("delete")) {
			userDao.delete(user.getUserId());
			userResult = user;
		}
		if (com.equals("search")) {
			User searchedUser =  userDao.getUser(user.getUserId());
			userResult = searchedUser!=null ? searchedUser : new User() ;
		}
		map.put("user",userResult);
		//map.put("userList",userDao.getAllUser());
		return "redirect:/";
	}

	
	

	
	
}
