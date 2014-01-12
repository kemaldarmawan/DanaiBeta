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

@Controller
public class UserController{
	@Autowired
	private UserDao userDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value="/register",method = RequestMethod.GET)
	public String register(Model model, HttpSession session){
		session.setAttribute("user",null);
		model.addAttribute("user", new User());
		return "register";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user == null){
			model.addAttribute("user",new User());
			return "login";
		}
		else{
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String doLogin(@ModelAttribute User user, Model model, HttpSession session){
		User _user = userDao.getUser(user.getUsername());
		if (_user.getPassword().equals(user.getPassword())){
			session.setAttribute("user", _user);
			return "redirect:/dashboard";
		}
		else{
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/register.do",method = RequestMethod.POST)
	public String doRegister(@ModelAttribute User user, Model model, HttpSession session){
		userDao.add(user);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String dashboard(Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		if (user == null){
			return "redirect:/login";
		}
		else{
			model.addAttribute("user",user);
			model.addAttribute("createdProject",(userDao.getUser(user.getUsername())).getCreatedProject());
			return "dashboard";
		}
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public String logout(Model model, HttpSession session){
		session.setAttribute("user",null);
		return "redirect:/login";
	}
	
}
