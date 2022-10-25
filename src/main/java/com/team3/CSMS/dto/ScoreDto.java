
package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.List;

import com.team3.CSMS.model.Score;

public class ScoreDto  implements Serializable{
    private static final long serialVersionUID = 1L;
    private int studentId;
    private String student;
    private String classlist;
    private int frequency;
    private int score;
    private String school;
    
    public ScoreDto(){
    }
    public ScoreDto(Score score){ 
        super();
        this.studentId=score.getSchool().getId();
        this.student=score.getStudent().getName();
        this.classlist=score.getClasslist().getClassCode();
        this.score=score.getScore();
        this.school=score.getSchool().getName();
    }
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
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
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}

}