/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class SubjectsDAO extends DBContext {

    Connection cnn;//ket noi DB
    PreparedStatement stm;//thuc hien cac cau lenh sql
    ResultSet rs;//dung de luu tru va xu ly du lieu lay ve tu select 

    public SubjectsDAO() {
        connectDB();

    }

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public ArrayList<Subjects> getSubjects() {
        ArrayList<Subjects> data = new ArrayList<Subjects>();
        try {
            String strSQL = "select*from Subjects";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String ID = rs.getString(1);
                String Code = rs.getString(2);
                String Name = rs.getString(3);
                String Credits = String.valueOf(rs.getInt(4));
                String Description = rs.getString(5);
                String Semester = rs.getString(6);
                String Lecturer_id = rs.getString(7);

                Subjects s = new Subjects(ID, Code, Name, Credits,
                        Description, Semester, Lecturer_id);
                data.add(s);
            }

        } catch (Exception e) {
            System.out.println("getSubjects:" + e.getMessage());
        }

        return data;
    }

    public void insert(Subjects s) {
        try {
            String strSQL = "insert into Subjects(code,name,credits,description"
                    + ",semester,lecturer_id)" + "values(?,?,?,?,?,?) ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, s.code);
            stm.setString(2, s.name);
            stm.setInt(3, Integer.parseInt(s.credits));
            stm.setString(4, s.description);
            stm.setString(5, s.semester);
            stm.setString(6, s.lecturer_id);

            stm.executeQuery();
        } catch (Exception e) {
            System.out.println("insert Subject:" + e.getMessage());
        }
    }

    public void delete(String id) {
        try {
            String strSQL = "delete from Subjects where ID=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            stm.executeQuery();
        } catch (Exception e) {
            System.out.println("delete:" + e.getMessage());
        }
    }

    public Subjects getSubjectsById(String id) {
        Subjects s = new Subjects();
        try {
            String strSQL = "select*from Subjects where ID=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                String code = rs.getString(2);
                String name = rs.getString(3);
                String credits = String.valueOf(rs.getInt(4));
                String description = rs.getString(5);
                String semester = rs.getString(6);
                String lucturer_id = rs.getString(7);

                s = new Subjects(id, code, name, credits, description, semester,
                        lucturer_id);
            }

        } catch (Exception e) {
            System.out.println("getSubjectById:" + e.getMessage());
        }

        return s;
    }

    public void update(Subjects s) {
        try {
            String strSQL = "UPDATE Subjects SET code=?, name=?, credits=?"
                    + ", description=?, semester=?, lecturer_id=? WHERE Id=?";

            PreparedStatement stm = connection.prepareStatement(strSQL);

            stm.setString(1, s.getCode());
            stm.setString(2, s.getName());
            stm.setInt(3, Integer.parseInt(s.getCredits()));
            stm.setString(4, s.getDescription());
            stm.setString(5, s.getSemester());
            stm.setString(6, s.getLecturer_id());
            stm.setInt(7, Integer.parseInt(s.getId()));

            int rowsAffected = stm.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }
}
