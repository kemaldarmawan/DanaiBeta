package com.danai.app;

import java.util.Date;
import java.util.Map;
import java.util.Set;

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

import com.danai.model.Category;
import com.danai.model.Comment;
import com.danai.model.Fund;
import com.danai.model.Location;
import com.danai.model.Project;
import com.danai.model.User;
import com.danai.model.editor.CategoryEditor;
import com.danai.model.editor.LocationEditor;
import com.danai.repository.CategoryDao;
import com.danai.repository.CommentDao;
import com.danai.repository.FundDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;
/**
 * Handles requests for the application home page.
 */

@Controller
public class DonationController {
	
	@Autowired
	private FundDao fundDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/project/donation",method = RequestMethod.GET)
	public String donation(Model model, HttpSession session){
		Project project = (Project) session.getAttribute("projectId");
		model.addAttribute("project", project);
		model.addAttribute("fund", new Fund());
		return "donation";
	}
	
	@RequestMapping(value="/project/insertdonation.do",method = RequestMethod.POST)
	public String doDonation(@ModelAttribute("fund") Fund fund, BindingResult result, Model model,HttpSession session){
		Date date = new Date();
		date.getTime();
		fund.setProject((Project) session.getAttribute("projectId"));
		fund.setUser((User) session.getAttribute("user"));
		fund.setCreatedDateTime(date);
		fundDao.add(fund);
		return "redirect:/dashboard";
	}
}
