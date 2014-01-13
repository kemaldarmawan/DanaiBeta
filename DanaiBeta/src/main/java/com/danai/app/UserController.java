package com.danai.app;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.lf5.util.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.danai.model.Category;
import com.danai.model.FileUpload;
import com.danai.model.Location;
import com.danai.model.User;
import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Handles requests for the application home page.
 */

@Controller
public class UserController{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	ServletContext servletContext;
	
	@Inject
	UserValidator userValidator;
	
	@Inject
	FileValidator fileValidator;
	
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
	@RequestMapping(value="/changeimage.do",method = RequestMethod.POST)
	public String doEditImage(@ModelAttribute("file") FileUpload uploadedFile, BindingResult result, Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		MultipartFile file = uploadedFile.getFile();
		fileValidator.validate(uploadedFile, result);
		
		String fileName = String.valueOf(user.getUserId()) + ".png";
		
		if (result.hasErrors()){
			model.addAttribute("user",user);
			return "dashboard";
		}
		
		try {
			inputStream = file.getInputStream();
			File newFile = new File(servletContext.getRealPath("/resources/photos/users/" + fileName));
			
			if (!newFile.exists()){
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];
			
			while ((read = inputStream.read(bytes)) != -1){
				outputStream.write(bytes,0,read);
			}
			outputStream.close();
		} catch (IOException e){
			e.printStackTrace();
		}
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value="/register.do",method = RequestMethod.POST)
	public String doRegister(@ModelAttribute("user") User user, BindingResult result, Model model){
		userValidator.validate(user,result);
		if (result.hasErrors()){
			return "register";
		}
		else {
			userDao.add(user);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/dashboard",method = RequestMethod.GET)
	public String dashboard(Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		if (user == null){
			return "redirect:/login";
		}
		else{
			model.addAttribute("user",user);
			model.addAttribute("file",new FileUpload());
			model.addAttribute("createdProject",(userDao.getUser(user.getUsername())).getCreatedProject());
			return "dashboard";
		}
	}
	
	@RequestMapping(value="/update.do",method = RequestMethod.POST)
	public String doUpdate(@ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session){
		User _user = (User) session.getAttribute("user");
		_user.setname(user.getname());
		_user.setBio(user.getBio());
		userValidator.validateUpdate(_user,result);
		if (result.hasErrors()){
			return "dashboard";
		}
		else {
			userDao.edit(_user);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/changepass.do",method = RequestMethod.POST)
	public String doChangePass(@ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session){
		User _user = (User) session.getAttribute("user");
		_user.setPassword(user.getPassword());
		userValidator.validateChangePass(_user,result);
		if (result.hasErrors()){
			return "dashboard";
		}
		else {
			userDao.edit(_user);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public String logout(Model model, HttpSession session){
		session.setAttribute("user",null);
		return "redirect:/login";
	}
	
}
