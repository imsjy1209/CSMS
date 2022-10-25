
package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.team3.CSMS.model.Score;

public class ScoreCatchDto implements Serializable {
	private static final long serialVersionUID = 1L;
	@JsonProperty("studentId")
	private int studentId; // Student table 列印學生id
	@JsonProperty("classCode")
	private int classcode; // 連 ClassList table 列印科目代號 1
	@JsonProperty("frequency")
	private int frequency; // score table 列印考試第幾次 1
	@JsonProperty("score")
	private int score; // score table 列印考試分數

	public ScoreCatchDto() {
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getClasscode() {
		return classcode;
	}

	public void setClasscode(int classcode) {
		this.classcode = classcode;
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



}