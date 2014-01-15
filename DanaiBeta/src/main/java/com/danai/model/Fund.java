package com.danai.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Fund {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int fundId;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=true)
	private Date createdDateTime;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="projectId")
	private Project project;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="userId")
	private User user;
	@Column
	private int value;
	
	public Fund() {}

	public Fund(int fundId, Date createdDateTime, Project project, User user,
			int value) {
		super();
		this.fundId = fundId;
		this.createdDateTime = createdDateTime;
		this.project = project;
		this.user = user;
		this.value = value;
	}

	public int getFundId() {
		return fundId;
	}

	public void setFundId(int fundId) {
		this.fundId = fundId;
	}

	public Date getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	

}
