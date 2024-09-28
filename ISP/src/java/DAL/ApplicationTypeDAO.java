/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.ApplicationType;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Dell
 */
public class ApplicationTypeDAO extends DBcontext{
    public List<ApplicationType> getAllApplicationTypes() {
        List<ApplicationType> applicationTypes = new ArrayList<>();
        String query = "SELECT * FROM application_type";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ApplicationType applicationType = new ApplicationType();
                applicationType.setId(rs.getInt("id"));
                applicationType.setTypeName(rs.getString("type_name"));

                applicationTypes.add(applicationType);
            }
        } catch (Exception e) {
            System.out.println("Error getting application types: " + e.getMessage());
        }
        return applicationTypes;
    }

    // Lấy loại ứng dụng theo ID
    public ApplicationType getApplicationTypeById(int id) {
        ApplicationType applicationType = null;
        String query = "SELECT * FROM application_type WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                applicationType = new ApplicationType();
                applicationType.setId(rs.getInt("id"));
                applicationType.setTypeName(rs.getString("type_name"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting application type by ID: " + e.getMessage());
        }
        return applicationType;
    }

    // Thêm loại ứng dụng mới
    public void insertApplicationType(ApplicationType applicationType) {
        String query = "INSERT INTO application_type (id, type_name) VALUES (?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, applicationType.getId());
            ps.setString(2, applicationType.getTypeName());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting application type: " + e.getMessage());
        }
    }

    // Cập nhật loại ứng dụng
    public void updateApplicationType(ApplicationType applicationType) {
        String query = "UPDATE application_type SET type_name = ? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, applicationType.getTypeName());
            ps.setInt(2, applicationType.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error updating application type: " + e.getMessage());
        }
    }

    // Xóa loại ứng dụng theo ID
    public void deleteApplicationType(int id) {
        String query = "DELETE FROM application_type WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting application type: " + e.getMessage());
        }
    }

    // Hàm main để kiểm tra việc lấy dữ liệu từ cơ sở dữ liệu
    public static void main(String[] args) {
        ApplicationTypeDAO dao = new ApplicationTypeDAO();
        List<ApplicationType> applicationTypes = dao.getAllApplicationTypes();

        // Kiểm tra và in ra kết quả
        if (applicationTypes != null && !applicationTypes.isEmpty()) {
            System.out.println("Dữ liệu đã lấy thành công:");
            for (ApplicationType applicationType : applicationTypes) {
                System.out.println("ID: " + applicationType.getId());
                System.out.println("Type Name: " + applicationType.getTypeName());
                System.out.println("-------------------------------");
            }
        } else {
            System.out.println("Không có dữ liệu nào được tìm thấy.");
        }
    }
    public int generateMaxID() {
        int maxID = 0;
        String query = "SELECT MAX(id) AS max_id FROM application_type";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxID = rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println("Error generating max ID: " + e.getMessage());
        }

        return maxID + 1; // Trả về ID lớn nhất + 1
    }
}
