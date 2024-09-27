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
public class ClassDAO extends DBContext {

    Connection cnn;//ket noi DB
    PreparedStatement stm;//thuc hien cac cau lenh sql
    ResultSet rs;//dung de luu tru va xu ly du lieu lay ve tu select 

    public ClassDAO() {
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

    public ArrayList<Classes> getClasses() {
        ArrayList<Classes> data = new ArrayList<Classes>();
        try {
            String strSQL = "select*from Class";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String class_id = rs.getString(1);
                String class_name = rs.getString(2);

                Classes c = new Classes(class_id, class_name);
                data.add(c);
            }

        } catch (Exception e) {
            System.out.println("getClass:" + e.getMessage());
        }

        return data;
    }

    public void insert(Classes c) {
        try {
            String strSQL = "insert into Class(class_name)" + "values(?) ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, c.class_name);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("insert:" + e.getMessage());
        }
    }

    public void delete(String id) {
        try {
            String strSQL = "delete from Class where class_id=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            stm.executeQuery();
        } catch (Exception e) {
            System.out.println("delete Class:" + e.getMessage());
        }
    }

    public Classes getClassesById(String id) {
        Classes c = new Classes();
        try {
            String strSQL = "select*from Class where class_id=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                String class_name = rs.getString(2);

                c = new Classes(id, class_name);
            }

        } catch (Exception e) {
            System.out.println("getClassById:" + e.getMessage());
        }

        return c;
    }

    public void update(Classes c) {
        try {
            String strSQL = "UPDATE Class SET class_name=? WHERE class_id=?";

            PreparedStatement stm = connection.prepareStatement(strSQL);

            
            stm.setString(1, c.class_name);
            stm.setString(2, c.class_id); 

            int rowsAffected = stm.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

}
