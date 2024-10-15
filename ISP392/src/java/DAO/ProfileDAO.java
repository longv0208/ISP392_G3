package DAO;

import Context.DBContext;
import Model.Student_Profile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;

public class ProfileDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Lấy thông tin Student_Profile từ session
    public Student_Profile getStudentProfile(HttpSession session) {
        Integer student_id = (Integer) session.getAttribute("user");
        String sql = "SELECT * FROM Student_Profile WHERE student_id = ?";
        Student_Profile studentProfile = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, student_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int majorId = rs.getInt("major_id");
                String yearOfStudy = rs.getString("year_of_study");
                int wallet = (int) rs.getLong("wallet");  // Lấy thông tin số dư ví

                studentProfile = new Student_Profile(student_id, majorId, yearOfStudy, wallet);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentProfile;
    }

    // Cập nhật thông tin Student_Profile (cập nhật số dư ví)
    public void updateStudentProfile(Student_Profile profile) throws SQLException {
        String sql = "UPDATE Student_Profile SET wallet = ? WHERE student_id = ?";
        try (Connection connection = new DBContext().getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, profile.getWallet()); // Cập nhật số dư ví
            statement.setInt(2, profile.getStudent_id());
            statement.executeUpdate();
        }
    }
}
