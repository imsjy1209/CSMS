package com.team3.CSMS.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="absentOrNot")
public class Absent{
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    
    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "days", columnDefinition = "datetime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss EEEE",timezone = "GMT+8")
	private Date dayz;
    
    // 對應課程
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_classlist_id")
    private ClassList ClassList;
    
	// 對應學生號碼
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="fk_student_id")
    private Student student;

    @Column(name="arrviedOrNot")
    private int arrviedOrNot;
    //---------------- Constructor------------------
    public Absent(){

    }
    public Absent(int id, Date dayz, ClassList classList, Student student,
            int arrviedOrNot) {
        this.id = id;
        this.dayz = dayz;
        ClassList = classList;
        this.student = student;
        this.arrviedOrNot = arrviedOrNot;
    }
    //-----------------------------------------------
    @PrePersist
    public void onCreate(){
        if(dayz == null){
            dayz =new Date();
        }
    }
    //-------------getter and setter----------------
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDayz() {
        return dayz;
    }

    public void setDayz(Date dayz) {
        this.dayz = dayz;
    }

    public ClassList getClassList() {
        return ClassList;
    }

    public void setClassList(ClassList classList) {
        ClassList = classList;
    }

    public Student getStudent() {
        return student;
    }
    //-----------------------------------------------------------

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getArrviedOrNot() {
        return arrviedOrNot;
    }

    public void setArrviedOrNot(int arrviedOrNot) {
        this.arrviedOrNot = arrviedOrNot;
    }

}