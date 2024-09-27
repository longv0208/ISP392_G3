/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author khucx
 */
public class Student_Profile {
    private User student_id;
    private Major major_id;
    private String year_of_study;

    public Student_Profile() {
    }

    public Student_Profile(User student_id, Major major_id, String year_of_study) {
        this.student_id = student_id;
        this.major_id = major_id;
        this.year_of_study = year_of_study;
    }

    

    public User getStudent_id() {
        return student_id;
    }

    public void setStudent_id(User student_id) {
        this.student_id = student_id;
    }

    public Major getMajor_id() {
        return major_id;
    }

    public void setMajor_id(Major major_id) {
        this.major_id = major_id;
    }

    public String getYear_of_study() {
        return year_of_study;
    }

    public void setYear_of_study(String year_of_study) {
        this.year_of_study = year_of_study;
    }

   
    
    
    
}
