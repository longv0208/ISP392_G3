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
public class Profile {
    private User user_id;
    private String full_name;
    private Date date_of_birth;
    private  String phone_number;
    private String address;
    private String gender;
    private String profile_picture;
    private String bio;

    public Profile() {
    }

    public Profile(User user_id, String full_name, Date date_of_birth, String phone_number, String address, String gender, String profile_picture, String bio) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.date_of_birth = date_of_birth;
        this.phone_number = phone_number;
        this.address = address;
        this.gender = gender;
        this.profile_picture = profile_picture;
        this.bio = bio;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_picture) {
        this.profile_picture = profile_picture;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    
}
