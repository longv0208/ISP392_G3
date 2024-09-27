/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.User;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author khucx
 */
public class DAO {
    Connection  conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<User> getAllUser(){
        List<User> list = new ArrayList<>();
        String query = "select * from Users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add( new User(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public User checkLogin(String username,String password){
        List<User> list = getAllUser();
        for(User u : list){
            if(u.getUsername().equals(username) && u.getPassword().equals(password)){
                return u;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<User> list = dao.getAllUser();
        for(User u : list){
            System.out.println(u);
        }
    }
}
