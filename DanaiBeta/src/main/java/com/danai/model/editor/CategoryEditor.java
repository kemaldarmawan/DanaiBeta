package com.danai.model.editor;

import org.springframework.stereotype.Component;
import java.beans.PropertyEditorSupport;
import com.danai.repository.CategoryDao;
import com.danai.model.Category;

public class CategoryEditor extends  PropertyEditorSupport{
	private final CategoryDao categoryDao;
	
	public CategoryEditor() {
		this.categoryDao = null;
	}
	
	public CategoryEditor(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	public void setAsText(String text) throws IllegalArgumentException{
		Category category = categoryDao.getCategory(Integer.parseInt(text));
		setValue(category);
	}
}
