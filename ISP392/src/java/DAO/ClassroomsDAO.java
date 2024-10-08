/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Classrooms;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassroomsDAO extends DBContext {

    // Insert a classroom into the database
    public int insert(Classrooms classroom) {
        String sql = "INSERT INTO Classrooms (name, capacity, location) VALUES (?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, classroom.getName());
            statement.setInt(2, classroom.getCapacity());
            statement.setString(3, classroom.getLocation());
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    // Delete a classroom by ID
    public void deleteById(int ID) {
        String sql = "DELETE FROM Classrooms WHERE ID = ?";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, ID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Check if a classroom exists by name
    public boolean classroomNameExists(String name) {
        String sql = "SELECT COUNT(*) FROM Classrooms WHERE name = ?";
        boolean exists = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    exists = resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Find all classrooms
    public List<Classrooms> findAll() {
        List<Classrooms> classrooms = new ArrayList<>();
        String sql = "SELECT * FROM Classrooms";

        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Classrooms classroom = new Classrooms();
                classroom.setID(rs.getInt("ID"));
                classroom.setName(rs.getString("name"));
                classroom.setCapacity(rs.getInt("capacity"));
                classroom.setLocation(rs.getString("location"));
                classrooms.add(classroom);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classrooms;
    }

    // Update a classroom by ID
    public int update(Classrooms classroom) {
        String sql = "UPDATE Classrooms SET name = ?, capacity = ?, location = ? WHERE ID = ?";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, classroom.getName());
            statement.setInt(2, classroom.getCapacity());
            statement.setString(3, classroom.getLocation());
            statement.setInt(4, classroom.getID());
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

}
