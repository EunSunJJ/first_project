package com.first_project.post.model;

import java.util.Date;

public class QuestionPost {

	private int id;
	private int userId;
	private String subject;
	private String content;
	private String imagePath;
	private boolean secretPost;
	private String password;
	private Date createdAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public boolean isSecretPost() {
		return secretPost;
	}
	public void setSecretPost(boolean secretPost) {
		this.secretPost = secretPost;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAtuser() {
		return updatedAtuser;
	}
	public void setUpdatedAtuser(Date updatedAtuser) {
		this.updatedAtuser = updatedAtuser;
	}
	private Date updatedAtuser;
	
}
	
	

