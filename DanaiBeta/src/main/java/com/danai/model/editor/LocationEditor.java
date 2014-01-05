package com.danai.model.editor;

import org.springframework.stereotype.Component;
import java.beans.PropertyEditorSupport;
import com.danai.repository.LocationDao;
import com.danai.model.Location;

@Component
public class LocationEditor extends PropertyEditorSupport {
	private final LocationDao locationDao;
	
	public LocationEditor(){
		this.locationDao = null;
	}
	
	public LocationEditor(LocationDao locationDao){
		this.locationDao = locationDao;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Location location  = locationDao.getLocation(Integer.parseInt(text));
		setValue(location);
	}
}
