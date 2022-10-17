package com.team3.CSMS.dto;

import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderListDto implements Serializable{
	 private static final long serialVersionUID = 1L;
	
	@JsonProperty("amountInfo")
	private Integer amount;
	
	@JsonProperty("paymentInfo")
	private String payment;
	
	@JsonProperty("studentInfoId")
	private Integer studentId;

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	
	
}
