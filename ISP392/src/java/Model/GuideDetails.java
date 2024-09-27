/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author trung
 */
public class GuideDetails {
    private int id;
    private Guidelines guideline_id;
    private int step_number;
    private String step_title;
    private String description;

    public GuideDetails() {
    }

    public GuideDetails(int id, Guidelines guideline_id, int step_number, String step_title, String description) {
        this.id = id;
        this.guideline_id = guideline_id;
        this.step_number = step_number;
        this.step_title = step_title;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Guidelines getGuideline_id() {
        return guideline_id;
    }

    public void setGuideline_id(Guidelines guideline_id) {
        this.guideline_id = guideline_id;
    }

    public int getStep_number() {
        return step_number;
    }

    public void setStep_number(int step_number) {
        this.step_number = step_number;
    }

    public String getStep_title() {
        return step_title;
    }

    public void setStep_title(String step_title) {
        this.step_title = step_title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

   
}
