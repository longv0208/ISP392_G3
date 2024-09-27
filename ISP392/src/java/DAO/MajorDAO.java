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
import Model.GuideDetails;
import Model.Guidelines;
import Model.Major;
import Model.User;
/**
 *
 * @author trung
 */
public class MajorDAO extends DBContext{

  public Major getMajorById(int majorId) {
    String sql = "SELECT [id], [major_name] FROM [dbo].[Major] WHERE [id] = ?";
    Major major = new Major();

    try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, majorId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            major.setId(rs.getInt("id"));
            major.setName(rs.getString("major_name"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return major;
}

}
