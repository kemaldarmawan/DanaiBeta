package com.danai.app;

import java.util.Map;

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
		map.put("user",userDao.getUser(1));
		map.put("userList",userDao.getAllUser());
		map.put("locationList", locationDao.getAllLocation());
		map.put("categoryList", categoryDao.getAllCategory());
		map.put("projectList", projectDao.getAllProject() );
		map.put("createdProjectList", userDao.getUser(1).getCreatedProject() );
		map.put("fundProjectList", projectDao.getProject(2).getFunds() );
		map.put("commentProjectList", projectDao.getProject(2).getComments() );
		return "danai";
	}
	
	
	@RequestMapping(value = "/list/user", method = RequestMethod.GET)
	public String listUser(Model model){
		
		model.addAttribute("listUser",userDao.getAllUser());
		return "home";
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
	
	
	@RequestMapping(value="/location/",method = RequestMethod.GET)
	public String location(Model model){
		model.addAttribute("locations", locationDao.getAllLocation());
		model.addAttribute("location", new Location());
		return "location";
	}
	
	@RequestMapping(value="/project_location/",method = RequestMethod.GET)
	public String projectLocation(Model model, HttpServletRequest request){
		
		//int loc_id = Integer.parseInt(request.getParameter("id"));
		//model.addAttribute("projectList", projectDao.getProjectByLocation(loc_id) );
		String search = request.getParameter("title");
		model.addAttribute("projectList", projectDao.getProjectSearchByTitle(search) );
		return "projectLocation";
		
	}
	
	@RequestMapping(value="/location/add",method = RequestMethod.POST)
	public String addLocation(@ModelAttribute Location location){
		locationDao.add(location);
		return "redirect:/location/";
	}
	@RequestMapping(value="/location/delete/{locationId}",method = RequestMethod.GET)
	public String deleteLocation(@PathVariable Integer locationId){
		System.out.println(locationDao.getLocation(locationId).getCity());
		locationDao.delete(locationId);
		return "redirect:/location/";
	}
	
	
}
