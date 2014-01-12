package com.danai.app;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.danai.model.*;
import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;

@Controller
public class AdminController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LocationDao locationDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProjectDao projectDao;
	

	// Location 
	
	@RequestMapping(value="/admin/location",method = RequestMethod.GET)
	public String location(Model model,HttpSession session){
		User _user = (User) session.getAttribute("user");
		if(_user == null){
			session.setAttribute("user", userDao.getUser(1));
			return "redirect:/";
		}
		else {
			model.addAttribute("locations", locationDao.getAllLocation());
			model.addAttribute("location", new Location());
			return "location";
		}
	}
	
	@RequestMapping(value="/admin/location/add",method = RequestMethod.POST)
	public String addLocation(@ModelAttribute Location location){
		if(location!= null){
			locationDao.add(location);
		}
		return "redirect:/admin/location/";
	}
	@RequestMapping(value="/admin/location/delete/{locationId}",method = RequestMethod.GET)
	public String deleteLocation(@PathVariable Integer locationId){
		System.out.println(locationDao.getLocation(locationId).getCity());
		locationDao.delete(locationId);
		return "redirect:/admin/location/";
	}
	
	
	
	
	// Category
	
	@RequestMapping(value="/admin/category/",method = RequestMethod.GET)
	public String category(Model model,HttpSession session){
		User _user = (User) session.getAttribute("_user");
		if(_user == null){
			session.setAttribute("_user", userDao.getUser(1));
			return "redirect:/";
		}
		else {
			model.addAttribute("categories", categoryDao.getAllCategory());
			model.addAttribute("category", new Category());
			return "category";
		}
	}
	
	@RequestMapping(value="/admin/category/add",method = RequestMethod.POST)
	public String addCategory(@ModelAttribute Category category){
		categoryDao.add(category);
		return "redirect:/admin/category/";
	}
	
	@RequestMapping(value="/admin/category/delete/{categoryId}",method = RequestMethod.GET)
	public String deleteCategory(@PathVariable Integer categoryId){
		categoryDao.delete(categoryId);
		return "redirect:/admin/category/";
	}
	
	
}
