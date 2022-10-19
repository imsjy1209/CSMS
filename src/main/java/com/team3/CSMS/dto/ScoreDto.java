
package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.List;

import com.team3.CSMS.model.Score;

public class ScoreDto  implements Serializable{
    private static final long serialVersionUID = 1L;
    
    private String student;
    private String classlist;
    private int frequency;
    private int score;
    private String school;
    
    public ScoreDto(){
    }
    public ScoreDto(Score Score){ 
        super();
        this.student=Score.getStudent().getName();
        this.classlist=Score.getClasslist().getClassCode();
        this.school=Score.getSchool().getName();
       //this.parent=Score.getParent().getName();
       // this.teacher=Score.getTeacher().getName();
        
    }
    // public ClassInfoDto(String teacherName, String classroom, String subject, String schoolType, String grade) {
    //     super();
    //     this.teacherName = teacherName;
    //     this.classroom = classroom;
    //     this.subject = subject;
    //     this.schoolType = schoolType;
    //     this.grade = grade;
    // }
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public String getClasslist() {
		return classlist;
	}
	public void setClasslist(String classlist) {
		this.classlist = classlist;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
//	public String getParent() {
//		return parent;
//	}
//	public void setParent(String parent) {
//		this.parent = parent;
//	}
//	public String getTeacher() {
//		return teacher;
//	}
//	public void setTeacher(String teacher) {
//		this.teacher = teacher;
//	}
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}