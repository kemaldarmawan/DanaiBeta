package com.danai.app;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.danai.model.Category;
import com.danai.model.FileUpload;
import com.danai.model.Location;
import com.danai.model.User;
import com.danai.repository.CategoryDao;
import com.danai.repository.LocationDao;
import com.danai.repository.ProjectDao;
import com.danai.repository.UserDao;

@Component
public class UserValidator implements Validator{
	 
	private static final String EMPTY = "";
	
	@Autowired
	private UserDao userDao;
	
	 @Override
	 public boolean supports(Class<?> clazz) {
		 return User.class.isAssignableFrom(clazz);
	 }
	 
	 @Override
	 public void validate(Object target, Errors errors){
		 User user = (User) target;
		 Pattern username_pattern = Pattern.compile("^[a-zA-Z0-9_\\.]{6,50}$");
		 Pattern password_pattern = Pattern.compile("^[a-zA-Z0-9_\\.]{6,50}$");
		 Pattern name_pattern = Pattern.compile("^[a-zA-Z\" \"]{2,100}$");
		 Pattern bio_pattern = Pattern.compile("^.{1,200}$");
		 if (null == user.getName()){
			 user.setName(EMPTY);
		 }
		 if (null == user.getUsername()){
			 user.setUsername(EMPTY);
		 }
		 if (null == user.getBio()){
			 user.setBio(EMPTY);
		 }
		 if (null == user.getPassword()){
			 user.setPassword(EMPTY);
		 }
		 Matcher username = username_pattern.matcher(user.getUsername());
		 Matcher password = password_pattern.matcher(user.getPassword());
		 Matcher bio = bio_pattern.matcher(user.getBio());
		 Matcher name = name_pattern.matcher(user.getName());
		 if (!username.matches()){
			 errors.rejectValue("username", "username.invalid", "Username harus terdiri dari 6-50 karakter alfanumerik dan dapat mengandung karakter . dan _");
		 }
		 else{
			 if(userDao.getUser(user.getUsername())!=null){
				 errors.rejectValue("username", "username.invalid", "Username tidak tersedia");
			 }
		 }
		 if (!password.matches()){
			 errors.rejectValue("password", "password.invalid", "Password harus terdiri dari 6-50 karakter alfanumerik dan dapat mengandung karakter . dan _");
		 }
		 if (!name.matches()){
			 errors.rejectValue("name", "name.invalid", "Nama lengkap harus terdiri dari 2-100 karakter a-z (sensitif) dan dapat mengandung karakter spasi");
		 }
		 if (!bio.matches()){
			 errors.rejectValue("bio", "bio.invalid", "Biodata harus terdiri dari 1-200 karakter");
		 }
	}
	 public void validateUpdate(Object target, Errors errors){
		 User user = (User) target;
		 Pattern name_pattern = Pattern.compile("^[a-zA-Z\" \"]{2,100}$");
		 Pattern bio_pattern = Pattern.compile("^.{1,200}$");
		 if (null == user.getName()){
			 user.setName(EMPTY);
		 }
		 if (null == user.getBio()){
			 user.setBio(EMPTY);
		 }
		 Matcher bio = bio_pattern.matcher(user.getBio());
		 Matcher name = name_pattern.matcher(user.getName());
		 if (!name.matches()){
			 errors.rejectValue("name", "name.invalid", "Nama lengkap harus terdiri dari 2-100 karakter a-z (sensitif) dan dapat mengandung karakter spasi");
		 }
		 if (!bio.matches()){
			 errors.rejectValue("bio", "bio.invalid", "Biodata harus terdiri dari 1-200 karakter");
		 }
	}
	
	 public void validateChangePass(Object target, Errors errors){
		 User user = (User) target;
		 Pattern password_pattern = Pattern.compile("^[a-zA-Z0-9_\\.]{6,50}$");
		 if (null == user.getPassword()){
			 user.setPassword(EMPTY);
		 }
		 Matcher password = password_pattern.matcher(user.getPassword());
		 if (!password.matches()){
			 errors.rejectValue("password", "password.invalid", "Password harus terdiri dari 6-50 karakter alfanumerik dan dapat mengandung karakter . dan _");
		 }
	}
	 
	 public void validateLogin(Object target, Errors errors){
		 User user = (User) target;
		 if (null == user.getUsername()){
			 user.setUsername(EMPTY);
		 }
		 if (null == user.getPassword()){
			 user.setPassword(EMPTY);
		 }
		 User _user = userDao.getUser(user.getUsername());
		 if (_user == null){
			 errors.rejectValue("username", "login.error", "Username/Password salah");
		 }
		 else {
			 if (!(_user.getPassword()).equals(user.getPassword())){
				 errors.rejectValue("username", "login.error", "Username/Password salah");
			 }
		 }
	}
	 
}
