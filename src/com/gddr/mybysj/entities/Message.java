package com.gddr.mybysj.entities;

import java.util.Date;

public class Message {
	private Integer messageId;
	private Project project;
	private User sender;
	private User receiver;
	private String messageContext;
	private Date sendeTime;

	public Message() {
		super();
	}

	public Message(Project project, User sender, User receiver, String messageContext, Date sendeTime) {
		super();
		this.project = project;
		this.sender = sender;
		this.receiver = receiver;
		this.messageContext = messageContext;
		this.sendeTime = sendeTime;
	}

	public Message(Integer messageId, Project project, User sender, User receiver, String messageContext,
			Date sendeTime) {
		super();
		this.messageId = messageId;
		this.project = project;
		this.sender = sender;
		this.receiver = receiver;
		this.messageContext = messageContext;
		this.sendeTime = sendeTime;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getMessageContext() {
		return messageContext;
	}

	public void setMessageContext(String messageContext) {
		this.messageContext = messageContext;
	}

	public Date getSendeTime() {
		return sendeTime;
	}

	public void setSendeTime(Date sendeTime) {
		this.sendeTime = sendeTime;
	}

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", project=" + project + ", sender=" + sender + ", receiver="
				+ receiver + ", messageContext=" + messageContext + "]";
	}

}
