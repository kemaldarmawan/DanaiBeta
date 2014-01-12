package com.danai.app;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;

@Controller
public class ModelTestingController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	LocationDao locationDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProjectDao projectDao;
	
	@RequestMapping(value="/modelTesting/", method = RequestMethod.GET)
	public String modelTesting(Model model)
	{
		model.addAttribute("user",userDao.getUser(1));
		model.addAttribute("userList",userDao.getAllUser());
		model.addAttribute("locationList", locationDao.getAllLocation());
		model.addAttribute("locationProjectList", locationDao.getLocation(1).getProjects());
		model.addAttribute("categoryList", categoryDao.getAllCategory());
		model.addAttribute("categoryProjectList", categoryDao.getCategory(1).getProjects());
		model.addAttribute("projectList", projectDao.getAllProject() );
		model.addAttribute("createdProjectList", userDao.getUser(1).getCreatedProject() );
		model.addAttribute("fundProjectList", projectDao.getProject(2).getFunds() );
		model.addAttribute("commentProjectList", projectDao.getProject(2).getComments() );
		return "modelTesting";
		
	}
	
	@RequestMapping(value="/modelTesting/editDel", method = RequestMethod.GET)
	public String modelTestingEdDel(Model model, HttpServletRequest request)
	{
		// edit location
		/*int loc_id = Integer.parseInt(request.getParameter("id"));
		String new_name = request.getParameter("city");
		Location loc = locationDao.getLocation(loc_id);
		loc.setCity(new_name);
		locationDao.edit(loc);*/
		// add category
		/*String name = request.getParameter("name");
		Category cat = new Category();
		cat.setName(name);
		categoryDao.add(cat);*/
		// del location
		int loc_id = Integer.parseInt(request.getParameter("id"));
		locationDao.delete(loc_id);
		model.addAttribute("user",userDao.getUser(1));
		model.addAttribute("userList",userDao.getAllUser());
		model.addAttribute("locationList", locationDao.getAllLocation());
		model.addAttribute("locationProjectList", locationDao.getLocation(1).getProjects());
		model.addAttribute("categoryList", categoryDao.getAllCategory());
		model.addAttribute("categoryProjectList", categoryDao.getCategory(1).getProjects());
		model.addAttribute("projectList", projectDao.getAllProject() );
		model.addAttribute("createdProjectList", userDao.getUser(1).getCreatedProject() );
		model.addAttribute("fundProjectList", projectDao.getProject(2).getFunds() );
		model.addAttribute("commentProjectList", projectDao.getProject(2).getComments() );
		return "modelTesting";
		
	}
	
	@RequestMapping(value="/modelTesting/user/",method = RequestMethod.GET)
	public String user(Model model, HttpServletRequest request){
		//model.addAttribute("users", locationDao.getAllLocation());
		String username = request.getParameter("username");
		model.addAttribute("user", userDao.getUser(username) );
		//model.addAttribute("user", new Location());
		return "modelTestingUser";
	}
	
	@RequestMapping(value="/modelTesting/project/",method = RequestMethod.GET)
	public String projectLocation(Model model, HttpServletRequest request){
		
		//int loc_id = Integer.parseInt(request.getParameter("id"));
		String usern = request.getParameter("s");
		System.out.println("search "+usern);
		//projectDao.addOrder("title", true);
		//projectDao.addOrder("category",true);
		projectDao.clearOrder();
		//projectDao.addOrder("lastDate", false);
		model.addAttribute("projectList", projectDao.getProjectSearchByProvince(usern));
		//String search = request.getParameter("title");
		//model.addAttribute("projectList", projectDao.getProjectSearchByTitle(search) );
		return "modelTestingProject";
		
	}
}
