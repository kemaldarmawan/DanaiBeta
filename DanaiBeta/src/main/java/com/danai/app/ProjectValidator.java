package com.danai.app;

import java.util.regex.Matcher;
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
		if (null == project.getTitle())
			project.setTitle(EMPTY);
		if (null == project.getDescription())
			project.setDescription(EMPTY);
		if (null == project.getExplanation())
			project.setExplanation(EMPTY);
		Pattern titlePattern = Pattern.compile("^.{1,100}$");
		Pattern descriptionPattern = Pattern.compile("^.{1,150}$");
		Pattern explanationPattern = Pattern.compile("^+");

		Matcher title = titlePattern.matcher(project.getTitle());
		Matcher description = descriptionPattern.matcher(project.getDescription());
		Matcher explanation = explanationPattern.matcher(project.getExplanation());

		System.out.println(project.getMinimalFund());
		if (project.getMinimalFund()==0)
			errors.rejectValue("minimalFund", "minimalFund.invalid", "minimal fund harus lebih besar dari 0");	
		if (!title.matches()) {
			errors.rejectValue("title","title.invalid","title tidak lebih banyak dari 100 karakter");
		}
		if (!description.matches()) {
			errors.rejectValue("description","description.invalid","description tidak lebih banyak dari 150 karakter");
		}
		if (!explanation.matches()) {
			errors.rejectValue("explanation","explanation.invalid","explanation harus ada");
		}
	}
	


}
