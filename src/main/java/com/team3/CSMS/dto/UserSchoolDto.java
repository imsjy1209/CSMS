package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class UserSchoolDto implements Serializable{
    private static final long serialVersionUID=1L;
    private Integer schoolId;
    private String SchoolName;
    private String title;
    private Integer whitelist;
    private Integer userID;
    public UserSchoolDto(){
        
    }
    public UserSchoolDto(Users users){
        this.userID=users.getId();
        this.schoolId=users.getSchool().getId();
        this.SchoolName=users.getSchool().getName();
        this.title=users.getSchool().getTitle();
        this.whitelist=users.getAccRight();
    }

    
    public Integer getUserID() {
        return userID;
    }
    public void setUserID(Integer userID) {
        this.userID = userID;
    }
    public Integer getSchoolId() {
        return schoolId;
    }
    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }
    public String getSchoolName() {
        return SchoolName;
    }
    public void setSchoolName(String schoolName) {
        SchoolName = schoolName;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Integer getWhitelist() {
        return whitelist;
    }
    public void setWhitelist(Integer whitelist) {
        this.whitelist = whitelist;
    }
  
}
