
package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.List;

import com.team3.CSMS.model.Score;

public class ScoreDto2 implements Serializable {
	private static final long serialVersionUID = 1L;
	private int scoreId;
	private int studentId; // Student table 列印學生id
	private String student; // Student table 列印學生姓名
	private String classcode; // 連 ClassList table 列印科目代號 1
	private int frequency; // score table 列印考試第幾次 1
	private int score; // score table 列印考試分數
	public ScoreDto2() {
	}
	public ScoreDto2(Score Score2) {
		super();
		this.scoreId=Score2.getId();
		this.studentId = Score2.getStudent().getId(); // 列印學生id
		this.student = Score2.getStudent().getName(); // 列印學生姓名		
		this.classcode = Score2.getClasslist().getClassCode(); // 列印科目代號
		this.frequency = Score2.getFrequency(); // 列印考試第幾次
		this.score = Score2.getScore(); // 列印考試分數
	}// 班導 classcode 主科 第幾次考試 老師

	public String getClasscode() {
		return classcode;
	}

	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}

	public int getScoreId() {
		return scoreId;
	}

	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	

}