/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Guidelines;
import Model.Major;
import Model.Profile;
import Model.Student_Profile;
import Model.User;

/**
 *
 * @author trung
 */
public class UserDAO extends DBContext {

    public User getUserById(int userId) {
        String sql = "SELECT [id], [username], [email], [password], [role], [status] FROM [dbo].[Users] WHERE [id] = ?";
        User user = new User();

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // lấy thống tin bảng profile 
    public Profile getProfileById(int userId) {
        String sql = "SELECT [user_id], [full_name], [date_of_birth], [phone_number],"
                + " [address], [gender], [profile_picture],"
                + " [bio] FROM [dbo].[Profile] WHERE [user_id] = ?";
        Profile profile = new Profile();

        // khởi tạo db lấy dữ liệu từ sql 
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
         
            // lấy userid truyền vào dấu ? thứ nhất trong sql 
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                UserDAO uDAO = new UserDAO();
                User user = uDAO.getUserById(rs.getInt("user_id"));
                profile.setUser_id(user);

                profile.setFull_name(rs.getString("full_name"));
                profile.setDate_of_birth(rs.getDate("date_of_birth"));
                profile.setPhone_number(rs.getString("phone_number"));
                profile.setAddress(rs.getString("address"));
                profile.setGender(rs.getString("gender"));
                profile.setProfile_picture(rs.getString("profile_picture"));
                profile.setBio(rs.getString("bio"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profile;
    }

    public Student_Profile getStudentProfile(int userId) {
        String sql = "SELECT [student_id], [major_id], [year_of_study] FROM [dbo].[Student_Profile] WHERE [student_id] = ?";
        Student_Profile studentProfile = new Student_Profile();

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                UserDAO uDao = new UserDAO();
                User user = uDao.getUserById(rs.getInt("student_id"));
                studentProfile.setStudent_id(user);

                MajorDAO mDao = new MajorDAO();
                Major major = mDao.getMajorById(rs.getInt("major_id"));
                studentProfile.setMajor_id(major);

                studentProfile.setYear_of_study(rs.getString("year_of_study"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentProfile;
    }

   

}
