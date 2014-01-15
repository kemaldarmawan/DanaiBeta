package com.danai.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Project {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int projectId;
	
	@ManyToOne( cascade = {CascadeType.ALL} )
	@JoinColumn(name="locationId")
	private Location location;
	
	@ManyToOne( cascade = {CascadeType.ALL} )
	@JoinColumn(name="categoryId")
	private Category category;
	
	@ManyToOne( cascade = {CascadeType.ALL} )
	@JoinColumn(name="userId")
	private User user;
	
	@Column
	private String title;
	@Column
	private String description;
	@Column
	private int minimalFund;
	@Column(nullable=true)
	private int currentFund;
	@Column(nullable=true)
	private int fundedNumber;
	
	@Temporal(TemporalType.DATE)
	@Column
	private Date createdDate;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=true)
	@DateTimeFormat(pattern="YYYY-MM-dd")
	private Date lastDate;
	
	@Column
	private String explanation;
	
	@OneToMany(mappedBy="project",fetch=FetchType.LAZY)
	private Set<Fund> funds;
	
	@OneToMany(mappedBy="project",fetch=FetchType.LAZY)
	private Set<Comment> comments;
	
	
	public Project() {
	}
	
	public Project(int projectId, Location location, Category category,
			User user, String title, String description, int minimalFund,
			Date createdDate, Date lastDate, String photo, String explanation) {
		super();
		this.projectId = projectId;
		this.location = location;
		this.category = category;
		this.user = user;
		this.title = title;
		this.description = description;
		this.minimalFund = minimalFund;
		this.createdDate = createdDate;
		this.lastDate = lastDate;
		this.explanation = explanation;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getMinimalFund() {
		return minimalFund;
	}
	public void setMinimalFund(int minimalFund) {
		this.minimalFund = minimalFund;
	}
	public int getCurrentFund() {
		return currentFund;
	}
	
	public int getFundedNumber() {
		return fundedNumber;
	}

	public void setFundedNumber(int fundedNumber) {
		this.fundedNumber = fundedNumber;
	}

	public void setCurrentFund(int currentFund) {
		this.currentFund = currentFund;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public Set<Fund> getFunds() {
		return funds;
	}

	public void setFunds(Set<Fund> funds) {
		this.funds = funds;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	
	
	

}
