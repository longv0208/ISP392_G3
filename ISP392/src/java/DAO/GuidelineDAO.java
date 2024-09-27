package DAO;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.GuideDetails;
import Model.Guidelines;
import Model.User;

public class GuidelineDAO extends DBContext {

    private Connection connection = getConnection();

    public List<Guidelines> getAllGuideline() {
        List<Guidelines> guidelinesList = new ArrayList<>();
        String sql = "SELECT * FROM Guidelines";

        try (
                PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Guidelines guideline = new Guidelines();
                guideline.setId(rs.getInt("id"));
                guideline.setTitle(rs.getString("title"));
                guideline.setCreate_date(rs.getDate("create_date"));

                UserDAO uDao = new UserDAO();
                User user = uDao.getUserById(rs.getInt("user_id"));
                guideline.setUser_id(user);

                guideline.setCategory(rs.getString("category"));
                guidelinesList.add(guideline);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guidelinesList;
    }

    public List<GuideDetails> getAllGuideDetail() {
        List<GuideDetails> guideDetailsList = new ArrayList<>();
        String sql = "SELECT [id], [guideline_id], [step_number], [step_title], [description] FROM [dbo].[GuideDetails]";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                GuideDetails guideDetail = new GuideDetails();
                guideDetail.setId(rs.getInt("id"));

                GuidelineDAO guidelineDao = new GuidelineDAO();
                Guidelines guideline = guidelineDao.getGuidelineById(rs.getInt("guideline_id"));
                guideDetail.setGuideline_id(guideline);

                guideDetail.setStep_number(rs.getInt("step_number"));
                guideDetail.setStep_title(rs.getString("step_title"));
                guideDetail.setDescription(rs.getString("description"));
                guideDetailsList.add(guideDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guideDetailsList;
    }

    private Guidelines getGuidelineById(int id) {
        Guidelines guideline = null;
        String sql = "SELECT [id], [title], [create_date], [user_id], [category] FROM [dbo].[Guidelines] WHERE [id] = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    guideline = new Guidelines();
                    guideline.setId(rs.getInt("id"));
                    guideline.setTitle(rs.getString("title"));
                    guideline.setCreate_date(rs.getDate("create_date"));

                    UserDAO uDao = new UserDAO();
                    User user = uDao.getUserById(rs.getInt("user_id"));
                    guideline.setUser_id(user);

                    guideline.setCategory(rs.getString("category"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guideline;
    }

    public List<GuideDetails> getGuideDetailByGuidelineId(int guidelineId) {
        List<GuideDetails> guideDetailsList = new ArrayList<>();
        String sql = "SELECT [id], [guideline_id], [step_number], [step_title], [description] "
                + "FROM .[dbo].[GuideDetails] WHERE [guideline_id] = ? ORDER BY [step_number]";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, guidelineId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    GuideDetails guideDetail = new GuideDetails();
                    guideDetail.setId(rs.getInt("id"));

                    GuidelineDAO guidelineDao = new GuidelineDAO();
                    Guidelines guideline = guidelineDao.getGuidelineById(rs.getInt("guideline_id"));
                    guideDetail.setGuideline_id(guideline);

                    guideDetail.setStep_number(rs.getInt("step_number"));
                    guideDetail.setStep_title(rs.getString("step_title"));
                    guideDetail.setDescription(rs.getString("description"));
                    guideDetailsList.add(guideDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guideDetailsList;
    }

    public boolean editGuidelineById(int id, String title, String category) {
        String sql = "UPDATE Guidelines SET title = ?, category = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, category);
            ps.setInt(3, id);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was updated
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if there was an error
        }
    }

    public boolean deleteById(int id) {
        String deleteGuideDetailsSql = "DELETE FROM GuideDetails WHERE guideline_id = ?";
        String deleteGuidelineSql = "DELETE FROM Guidelines WHERE id = ?";
        boolean isDeleted = false;

        try {
            connection.setAutoCommit(false);

            try (PreparedStatement ps1 = connection.prepareStatement(deleteGuideDetailsSql)) {
                ps1.setInt(1, id);
                ps1.executeUpdate();
            }

            try (PreparedStatement ps2 = connection.prepareStatement(deleteGuidelineSql)) {
                ps2.setInt(1, id);
                int rowsAffected = ps2.executeUpdate();
                isDeleted = rowsAffected > 0;
            }

            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isDeleted;
    }

    public boolean updateGuideDetailById(int id, String stepTitle, String stepDescription) {
        String query = "UPDATE GuideDetails SET step_title = ?, description = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, stepTitle);
            ps.setString(2, stepDescription);
            ps.setInt(3, id);

            int updatedRows = ps.executeUpdate();
            return updatedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteGuideDetailById(int id) {
        String query = "DELETE FROM GuideDetails WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, id);

            int deletedRows = ps.executeUpdate();
            return deletedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean createNewGuideDetail(int guidelineId, int stepNumber, String detailDescription, String detailTitle) {
        String sql = "INSERT INTO GuideDetails (guideline_id, step_number, step_title, description) VALUES (?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, guidelineId);
            pstmt.setInt(2, stepNumber);
            pstmt.setString(3, detailTitle);
            pstmt.setString(4, detailDescription);

            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
