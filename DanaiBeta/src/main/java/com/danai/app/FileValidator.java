package com.danai.app;

import com.danai.model.User;
import com.danai.model.FileUpload;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class FileValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		 return FileUpload.class.isAssignableFrom(clazz);
	 }
	
	@Override
	public void validate(Object uploadedFile, Errors errors){
		FileUpload file = (FileUpload) uploadedFile;
		if(file.getFile().getSize()==0){
			errors.rejectValue("file", "file.error","File kosong");
		}
	}
}
