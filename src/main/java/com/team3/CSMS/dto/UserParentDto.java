package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class UserParentDto implements Serializable{
    private static final long serialVersionUID=1L;
    
    private Integer parentId;
    private String parentsName;
    private Integer whitelist;

    public UserParentDto(){
    }
    public UserParentDto(Users users){
        
        this.parentId=users.getParent().getId();
        this.parentsName=users.getParent().getName();
        this.whitelist=users.getAccRight();
    }

    public Integer getParentId() {
        return parentId;
    }
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    public String getParentsName() {
        return parentsName;
    }
    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }
    public Integer getWhitelist() {
        return whitelist;
    }
    public void setWhitelist(Integer whitelist) {
        this.whitelist = whitelist;
    }
    
    
}
