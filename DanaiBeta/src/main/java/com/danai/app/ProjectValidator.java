package com.danai.app;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.danai.model.Project;
import com.danai.repository.ProjectDao;

@Component
public class ProjectValidator implements Validator {
	
	private static final String EMPTY = "";
	
	@Autowired
	private ProjectDao projectDao;

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Project.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		Project project = (Project) target;
		System.out.println(project.getMinimalFund());
		if (project.getMinimalFund()==0)
			errors.rejectValue("minimalFund", "minimalFund.invalid", "minimal fund harus lebih besar dari 0");	
	}
	


}
