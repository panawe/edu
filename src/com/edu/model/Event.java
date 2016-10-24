package com.edu.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.NotNull;

import com.edu.util.Utils;

@Entity
@Table(name = "EVENT")
public class Event extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "EVENT_ID")
	private Long id;

	@NotNull
	@Column(name = "TITLE")
	private String title;
	
	@NotNull
	@Column(name = "DESCRIPTION")
	private String description;

	@NotNull
	@Column(name = "BEGIN_TIME")
	private Date beginDateTime;

	@NotNull
	@Column(name = "END_TIME")
	private Date endDateTime;

	@Transient
	private boolean inFuture;

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

	@Transient
	public String getShortDescription() {
		return description != null && description.length() > 170 ? Utils.truncateHTML(description,170,null) : description;
	}

	@Transient
	public boolean getShowDescriptionLink() {
		return description != null && description.length() > 170 ? true : false;
	}
	
	public Date getBeginDateTime() {
		return beginDateTime;
	}

	public void setBeginDateTime(Date beginDateTime) {
		this.beginDateTime = beginDateTime;
	}

	public Date getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(Date endDateTime) {
		this.endDateTime = endDateTime;
	}
	
	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean getInFuture() {
		inFuture = endDateTime.compareTo(new Date()) >= 0;
		return inFuture;
	}

}
