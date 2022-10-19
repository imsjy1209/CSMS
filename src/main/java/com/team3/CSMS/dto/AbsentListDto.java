package com.team3.CSMS.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AbsentListDto implements Serializable{
    private static final long serialVersionUID=1L;
    @JsonProperty("classCodeId")
    private Integer classCodeId;
    @JsonProperty("studentId")
    private Integer studentId;
    @JsonProperty("absOrNot")
    private Integer arrivedValue;

    public AbsentListDto(){
    }

    public Integer getClassCodeId() {
        return classCodeId;
    }
    public void setClassCodeId(Integer classCodeId) {
        this.classCodeId = classCodeId;
    }
    public Integer getStudentId() {
        return studentId;
    }
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
    public Integer getArrivedValue() {
        return arrivedValue;
    }
    public void setArrivedValue(Integer arrivedValue) {
        this.arrivedValue = arrivedValue;
    }
}
