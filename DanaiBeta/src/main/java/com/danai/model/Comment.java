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
public class Comment {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int commentId;
	
	@Column
	private String content;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column
	private Date createdDateTime;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="projectId")
	private Project project;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userId")
	private User user;
	
	public Comment() {}

	public Comment(int commentId, String content, Date createdDateTime,
			Project project, User user) {
		super();
		this.commentId = commentId;
		this.content = content;
		this.createdDateTime = createdDateTime;
		this.project = project;
		this.user = user;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	
	
	

}
