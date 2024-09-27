/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author admin
 */
public class DBContext {
    protected Connection connection;

    public DBContext() {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "123456";
            String url = "jdbc:sqlserver://LAPTOP-1E5NPF6K\\SQLEXPRESS:1433;databaseName=ISP392";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public static void main(String[] args) {
        DBContext context = new DBContext();
        if (context.connection != null) {
            System.out.println("Connected to the database successfully.");
            try {
                context.connection.close(); // Đóng kết nối sau khi kiểm tra
            } catch (SQLException ex) {
                System.out.println("Error while closing the connection: " + ex.getMessage());
            }
        } else {
            System.out.println("Failed to connect to the database.");
        }
    }
    
}
