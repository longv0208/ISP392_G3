/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author khucx
 */
public class Student_Profile {

    int student_id, major_id;
    String year_of_study;
    int wallet;

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public String getYear_of_study() {
        return year_of_study;
    }

    public void setYear_of_study(String year_of_study) {
        this.year_of_study = year_of_study;
    }

    public int getWallet() {
        return wallet;
    }

    public void setWallet(int wallet) {
        this.wallet = wallet;
    }

    public Student_Profile() {
    }
    

    public Student_Profile(Integer student_id1, int student_id, String year_of_study, int major_id, int wallet) {
        this.student_id = student_id;
        this.major_id = major_id;
        this.year_of_study = year_of_study;
        this.wallet = wallet;
    }

    @Override
    public String toString() {
        return "Student_Profile{" + "student_id=" + student_id + ", major_id=" + major_id + ", year_of_study=" + year_of_study + ", wallet=" + wallet + '}';
    }

    public void add(Student_Profile studentProfile) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
