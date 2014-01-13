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

public class ProjectController {
	
	private UserDao userDao;
	
	@RequestMapping(value="/project",method = RequestMethod.GET)
	public String project(Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user == null){
			model.addAttribute("user",new User());
			return "login";
		}
		else{
			return "redirect:/dashboard";
		}
	}
}
