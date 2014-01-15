package com.danai.app;


import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

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

import com.danai.model.*;
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
	
	@RequestMapping(value = "/errors/404")
	public String handle404(){
		return "404";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		projectDao.addOrder("currentFund", false);
		projectDao.addOrder("fundedNumber", false);
		List<Project> p1= projectDao.getAllProject();
		ConcurrentMap<Integer, Project> map = new ConcurrentHashMap<Integer, Project>();
		for(Project p: p1) map.putIfAbsent(p.getCategory().getCategoryId(), p);
		model.addAttribute("projectsByCategory", map.values());
		model.addAttribute("projectsByPopular",projectDao.getAllProject().subList(0,4));
		return "danai";
	}
	
	@RequestMapping(value = "/discover" , method = RequestMethod.GET)
	public String discover(Model model){
		projectDao.clearOrder();
		projectDao.addOrder("currentFund", false);
		projectDao.addOrder("fundedNumber", false);
		List<Project> p1= projectDao.getAllProject();
		ConcurrentMap<Integer, Project> map = new ConcurrentHashMap<Integer, Project>();
		for(Project p: p1) map.putIfAbsent(p.getCategory().getCategoryId(), p);
		List projects = new ArrayList(map.values());
		model.addAttribute("staffPicks", projects.subList(0, projects.size()<3?projects.size():3));
		model.addAttribute("populars",projectDao.getAllProject().subList(0,3));
		model.addAttribute("categories",categoryDao.getAllCategory());
		return "discover";
	}
	
	@RequestMapping(value = "/discover/categories/{categoryId}" , method = RequestMethod.GET)
	public String discoverCategories(Model model , HttpServletRequest request , @PathVariable Integer categoryId){
		model.addAttribute("results",projectDao.getProjectByCategory(categoryId));
		model.addAttribute("categories",categoryDao.getAllCategory());
		model.addAttribute("category",categoryDao.getCategory(categoryId));
		return "discoverCategories";
	}
	
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(Model model,HttpServletRequest request){
		String param = (String)request.getParameter("s");
		if(param.trim().equals("") || param.length() < 3) return "redirect:/";
		model.addAttribute("res", param);
		
		List<Project> p1= projectDao.getProjectSearchByTitle(param);
		List<Project> p2= projectDao.getProjectSearchByUsername(param); 
		List<Project> p3= projectDao.getProjectSearchByCategory(param); 
		List<Project> p4= projectDao.getProjectSearchByCity(param);
		
		ConcurrentMap<Integer, Project> map = new ConcurrentHashMap<Integer, Project>();
		for(Project p: p1) map.putIfAbsent(p.getProjectId(), p);
		for(Project p: p2) map.putIfAbsent(p.getProjectId(), p);
		for(Project p: p3) map.putIfAbsent(p.getProjectId(), p);
		for(Project p: p4) map.putIfAbsent(p.getProjectId(), p);
		
		Collection<Project> result = map.values();
		model.addAttribute("result",result);
		return "search";
	}
	
}
