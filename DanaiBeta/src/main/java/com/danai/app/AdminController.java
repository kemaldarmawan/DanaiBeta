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

import com.danai.model.Location;
import com.danai.model.User;
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
	
	@RequestMapping(value="/admin/location/",method = RequestMethod.GET)
	public String location(Model model,HttpSession session){
		User _user = (User) session.getAttribute("_user");
		if(_user == null){
			session.setAttribute("_user", userDao.getUser(1));
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
		locationDao.add(location);
		return "redirect:/admin/location/";
	}
	@RequestMapping(value="/admin/location/delete/{locationId}",method = RequestMethod.GET)
	public String deleteLocation(@PathVariable Integer locationId){
		System.out.println(locationDao.getLocation(locationId).getCity());
		locationDao.delete(locationId);
		return "redirect:/admin/location/";
	}
}
