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
import com.danai.model.Location;
import com.danai.model.Project;
import com.danai.model.User;
import com.danai.model.editor.CategoryEditor;
import com.danai.model.editor.LocationEditor;
import com.danai.repository.CategoryDao;
import com.danai.repository.CommentDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;
/**
 * Handles requests for the application home page.
 */

@Controller
public class ProjectController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@RequestMapping(value="/project/{projectId}",method = RequestMethod.GET)
	public String project(Model model, HttpSession session, @PathVariable Integer projectId){
		Project project = projectDao.getProject(projectId);
		User iuser = (User) session.getAttribute("user");
		session.setAttribute("projectId", project);
		Set<Comment> comment = project.getComments();
		model.addAttribute("project", project);
		model.addAttribute("comment", comment);
		model.addAttribute("addcomment", new Comment());
		model.addAttribute("user", iuser);
		return "project";
	}
	
	@RequestMapping(value="/project/insertcomment.do",method = RequestMethod.POST)
	public String doComment(@ModelAttribute("addcomment") Comment comment, BindingResult result, Model model,HttpSession session){
		Date date = new Date();
		date.getTime();
		comment.setProject((Project) session.getAttribute("projectId"));
		Project project = (Project) session.getAttribute("projectId");
		comment.setUser((User) session.getAttribute("user"));
		comment.setCreatedDateTime(date);
		commentDao.add(comment);
		return "redirect:/project/"+project.getProjectId();
	}
}
