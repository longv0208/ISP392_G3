/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.sql.Timestamp;
/**
 *
 * @author khucx
 */
public class Notifications {
    int id;
    String title,content,role;
    String upload_time;

    public Notifications() {
    }

    @Override
    public String toString() {
        return "Notifications{" + "id=" + id + ", title=" + title + ", content=" + content + ", role=" + role + ", upload_time=" + upload_time + '}';
    }

    public Notifications(int id, String title, String content, String role, String upload_time) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.role = role;
        this.upload_time = upload_time;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(String upload_time) {
        this.upload_time = upload_time;
    }
    
}
