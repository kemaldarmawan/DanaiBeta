package com.danai.model;

import java.util.Date;
import java.util.Set;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProjectForm {
	Project project;
	FileUpload fileUploaded;
	public Project getProject(){
		return project;
	}
	public void setProject(Project project){
		this.project=project;
	}
	public FileUpload getFileUploaded(){
		return fileUploaded;
	}
	public void setFileUploaded(FileUpload file){
		this.fileUploaded=file;
	}
	
	public int getProjectId() {
		return project.getProjectId();
	}
	public void setProjectId(int projectId) {
		this.project.setProjectId(projectId);
	}
	public Location getLocation() {
		return project.getLocation();
	}
	public void setLocation(Location location) {
		this.project.setLocation(location);
	}
	public Category getCategory() {
		return project.getCategory();
	}
	public void setCategory(Category category) {
		this.project.setCategory(category);
	}
	public User getUser() {
		return project.getUser();
	}
	public void setUser(User user) {
		this.project.setUser(user);
	}
	public String getTitle() {
		return project.getTitle();
	}
	public void setTitle(String title) {
		this.project.setTitle(title);
	}
	public String getDescription() {
		return project.getDescription();
	}
	public void setDescription(String description) {
		this.project.setDescription(description);
	}
	public int getMinimalFund() {
		return project.getMinimalFund();
	}
	public void setMinimalFund(int minimalFund) {
		this.project.setMinimalFund(minimalFund);;
	}
	public int getCurrentFund() {
		return project.getCurrentFund();
	}
	
	public int getFundedNumber() {
		return project.getFundedNumber();
	}

	public void setFundedNumber(int fundedNumber) {
		this.project.setFundedNumber(fundedNumber);;
	}

	public void setCurrentFund(int currentFund) {
		this.project.setCurrentFund(currentFund);
	}
	public Date getCreatedDate() {
		return project.getCreatedDate();
	}
	public void setCreatedDate(Date createdDate) {
		this.project.setCreatedDate(createdDate);
	}
	public Date getLastDate() {
		return project.getLastDate();
	}
	public void setLastDate(Date lastDate) {
		this.project.setLastDate(lastDate);
	}
	public String getExplanation() {
		return project.getExplanation();
	}
	public void setExplanation(String explanation) {
		this.project.setExplanation(explanation);
	}

	public Set<Fund> getFunds() {
		return project.getFunds();
	}

	public void setFunds(Set<Fund> funds) {
		this.project.setFunds(funds);;
	}

	public Set<Comment> getComments() {
		return project.getComments();
	}

	public void setComments(Set<Comment> comments) {
		this.project.setComments(comments);
	}
	
	public CommonsMultipartFile getFile(){
		return fileUploaded.getFile();
	}
	
	public void setFile(CommonsMultipartFile file){
		this.fileUploaded.setFile(file);
	}
	
}
