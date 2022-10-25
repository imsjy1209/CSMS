package com.team3.CSMS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="messagez")
public class Messagez {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "messagez_id")
    private Integer id;
        
    @ManyToOne
    @JoinColumn(name="fk_parent_id")
    private Parent parent;

    @ManyToOne
    @JoinColumn(name="fk_school_id")
    private School school;

    // check send to school or not
    @Column(name="toSchool")
    private int toSchool;
    
    @Column(name="typeOfMsg")
    private String typeOfMsg;
    
    @Column(name="titleOfMsg")
    private String titleOfMsg;
    
    //SQL nvarchar(max)
    @Column(name="whatToSay")
    private String whatToSay;
    
    @Column(name="readOrNot")
    private int readOrNot;
    
    //-------------建構值--------------
    public Messagez(){
    }

    public Messagez(Integer id, Parent parent, School school, int toSchool, String typeOfMsg, String titleOfMsg,
            String whatToSay, int readOrNot) {
        super();
        this.id = id;
        this.parent = parent;
        this.school = school;
        this.toSchool = toSchool;
        this.typeOfMsg = typeOfMsg;
        this.titleOfMsg = titleOfMsg;
        this.whatToSay = whatToSay;
        this.readOrNot = readOrNot;
    }
    //--------------------------getter &setter--------------------
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Parent getParent() {
        return parent;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public int getToSchool() {
        return toSchool;
    }

    public void setToSchool(int toSchool) {
        this.toSchool = toSchool;
    }

    public String getTypeOfMsg() {
        return typeOfMsg;
    }

    public void setTypeOfMsg(String typeOfMsg) {
        this.typeOfMsg = typeOfMsg;
    }

    public String getTitleOfMsg() {
        return titleOfMsg;
    }

    public void setTitleOfMsg(String titleOfMsg) {
        this.titleOfMsg = titleOfMsg;
    }

    public String getWhatToSay() {
        return whatToSay;
    }

    public void setWhatToSay(String whatToSay) {
        this.whatToSay = whatToSay;
    }

    public int getReadOrNot() {
        return readOrNot;
    }

    public void setReadOrNot(int readOrNot) {
        this.readOrNot = readOrNot;
    }

    
    

}