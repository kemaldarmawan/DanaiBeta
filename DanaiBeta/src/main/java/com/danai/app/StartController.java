package com.danai.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.danai.model.Category;
import com.danai.model.FileUpload;
import com.danai.model.Location;
import com.danai.model.Project;
import com.danai.model.User;
import com.danai.model.editor.CategoryEditor;
import com.danai.model.editor.LocationEditor;
import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;
import com.danai.repository.FundDao;
/**
 * Handles requests for the application home page.
 */
@Controller
public class StartController {
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private FundDao fundDao;
	
	@Autowired
	private LocationDao locationDao;
	
	@Autowired
	ServletContext servletContext;
	
	@Inject
	UserValidator userValidator;
	
	@Inject
	FileValidator fileValidator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Category.class, new CategoryEditor(categoryDao));
		binder.registerCustomEditor(Location.class, new LocationEditor(locationDao));
	}
	
	
	@RequestMapping(value="/start",method = RequestMethod.GET)
	public String start(Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		if (user == null){
			return "redirect:/login";
		}
		else{
			model.addAttribute("user",user);
			model.addAttribute("createdProject",(userDao.getUser(user.getUsername())).getCreatedProject());
			model.addAttribute("project", new Project());
			model.addAttribute("categories", categoryDao.getAllCategory());
			model.addAttribute("locations", locationDao.getAllLocation());
			return "start";
		}
	}
	
	@RequestMapping(value="/insertimage.do",method = RequestMethod.POST)
	public String doEditImage(@ModelAttribute("file") FileUpload uploadedFile, BindingResult result, Model model, HttpSession session){
		Project project = new Project();
		projectDao.add(project);
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		MultipartFile file = uploadedFile.getFile();
		fileValidator.validate(uploadedFile, result);
		
		String fileName = String.valueOf(project.getProjectId()) + ".png";
		
		if (result.hasErrors()){
			model.addAttribute("project",project);
			return "start";
		}
		
		try {
			inputStream = file.getInputStream();
			File newFile = new File(servletContext.getRealPath("/resources/photos/projects/" + fileName));
			
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
		return "redirect:/start";
	}
	
	@RequestMapping(value="/insertdata.do",method = RequestMethod.POST)
	public String doRegister(@ModelAttribute("data") Project project, BindingResult result, Model model,HttpSession session){
		User user = new User();
		Date date = new Date();
		
		date.getTime();
		project.setCreatedDate(date);
		project.setCurrentFund(0);
		project.setFundedNumber(0);
		project.setUser((User) session.getAttribute("user"));
		projectDao.add(project);
		return "redirect:/dashboard";
	}
}
