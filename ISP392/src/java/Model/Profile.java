/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.text.Normalizer;
import java.util.Date;
import java.util.regex.Pattern;

/**
 *
 * @author khucx
 */
public class Profile {
    int user_id;
    String full_name,phone_number,addess,gender,profile_picture,bio;
    Date date_of_birth;

    @Override
    public String toString() {
        return "Profile{" + "user_id=" + user_id + ", full_name=" + full_name + ", phone_number=" + phone_number + ", addess=" + addess + ", gender=" + gender + ", profile_picture=" + profile_picture + ", bio=" + bio + ", date_of_birth=" + date_of_birth + '}';
    }

    public Profile(int user_id, String full_name, Date date_of_birth, String phone_number, String addess, String gender, String profile_picture, String bio) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.phone_number = phone_number;
        this.addess = addess;
        this.gender = gender;
        this.profile_picture = profile_picture;
        this.bio = bio;
        this.date_of_birth = date_of_birth;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddess() {
        return addess;
    }

    public void setAddess(String addess) {
        this.addess = addess;
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

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }
    
    public static String removeUnicode(String input) {
        // Normalize chuỗi để tách các dấu
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        // Loại bỏ các dấu Unicode
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("").replaceAll("đ", "d").replaceAll("Đ", "D");
    }
    
    public String generateLecturerFormattedId() {
        // Tách tên thành các từ dựa trên dấu cách
        String[] nameParts = removeUnicode(full_name).split(" ");

        // Lấy từ cuối cùng của tên và chuyển về chữ thường
        String lastName = nameParts[nameParts.length - 1].toLowerCase();

        // Lấy chữ cái đầu của các từ còn lại
        StringBuilder initials = new StringBuilder();
        for (int i = 0; i < nameParts.length - 1; i++) {
            initials.append(nameParts[i].charAt(0)); // Lấy ký tự đầu của mỗi từ
        }

        // Định dạng kết quả theo format: lastName + initials + id
        return lastName + initials.toString().toLowerCase() + user_id;
    }
}
