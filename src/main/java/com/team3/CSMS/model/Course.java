package com.team3.CSMS.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="Course")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Course {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="course_id")
	private Integer id;
	
	@Column(name="courseyear", nullable = false)
	private int courseYear;
	
	@Column(name="coursesemester",columnDefinition = "nvarchar(10)", nullable = false)
	private String courseSemester;
	
	@Column(name="coursecategory",columnDefinition = "nvarchar(50)", nullable = false)
	private String courseCategory;
	
	@Column(name="coursesubject",columnDefinition = "nvarchar(50)", nullable = false)
	private String courseSubject;
	
	@Column(name="coursegrade",columnDefinition = "nvarchar(50)", nullable = false)
	private String courseGrade;
	
	@Column(name="courseclass", nullable = false)
	private int courseClass;
	
	@Column(name="courseprice", nullable = false)
	private int coursePrice;
	
	@Column(name="courseteachTime",columnDefinition = "nvarchar(50)", nullable = false)
	private String courseTeachTime;
	
	@Column(name="coursemember", nullable = false)
	private int courseMember;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="startdate", columnDefinition = "datetime", nullable = false)
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	private Date startDate;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="enddate", nullable = false, columnDefinition = "datetime")
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	private Date endDate;
	
	@Column(name="courseonoff" ,columnDefinition = "bit", nullable = false)
	private int courseOnOff;
	
	@Column(name="coursepic")
	private String coursePic;

	public String getCoursePic() {
		return coursePic;
	}

	public void setCoursePic(String coursePic) {
		this.coursePic = coursePic;
	}

	public Course() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCourseYear() {
		return courseYear;
	}

	public void setCourseYear(int courseYear) {
		this.courseYear = courseYear;
	}

	public String getCourseSemester() {
		return courseSemester;
	}

	public void setCourseSemester(String courseSemester) {
		this.courseSemester = courseSemester;
	}

	public String getCourseCategory() {
		return courseCategory;
	}

	public void setCourseCategory(String courseCategory) {
		this.courseCategory = courseCategory;
	}

	public String getCourseSubject() {
		return courseSubject;
	}

	public void setCourseSubject(String courseSubject) {
		this.courseSubject = courseSubject;
	}

	public String getCourseGrade() {
		return courseGrade;
	}

	public void setCourseGrade(String courseGrade) {
		this.courseGrade = courseGrade;
	}

	public int getCourseClass() {
		return courseClass;
	}

	public void setCourseClass(int courseClass) {
		this.courseClass = courseClass;
	}

	public int getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}

	public String getCourseTeachTime() {
		return courseTeachTime;
	}

	public void setCourseTeachTime(String courseTeachTime) {
		this.courseTeachTime = courseTeachTime;
	}

	public int getCourseMember() {
		return courseMember;
	}

	public void setCourseMember(int courseMember) {
		this.courseMember = courseMember;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getCourseOnOff() {
		return courseOnOff;
	}

	public void setCourseOnOff(int courseOnOff) {
		this.courseOnOff = courseOnOff;
	}

}