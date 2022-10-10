package com.team3.CSMS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="expense")
@Component
public class Expense {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="year")
	private String year;
	
	@Column(name="semester")
	private String semester;
	
	@Column(name="income")
	private int income;
	
	@Column(name="totalcost")
	private int totalcost;
	
	@Column(name="markting")
	private int markting;
	
	@Column(name="personnel")
	private int personnel;
	
	@Column(name="other")
	private int other;
	
	public Expense(String year, String semester, int income, int totalcost, int markting, int personnel, int other) {
		super();
		this.year = year;
		this.semester = semester;
		this.income = income;
		this.totalcost = totalcost;
		this.markting = markting;
		this.personnel = personnel;
		this.other = other;
	}

	public Expense() {
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}

	public int getMarkting() {
		return markting;
	}

	public void setMarkting(int markting) {
		this.markting = markting;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public int getOther() {
		return other;
	}

	public void setOther(int other) {
		this.other = other;
	}

}