package Model;

public class ClassroomFacilities {
    private int classroomID;
    private int numberOfTables;
    private int numberOfChairs;
    private int numberOfLights;
    private int numberOfProjectors;
    private String condition; // tình trạng của các thiết bị

    // Getters and setters
    public int getClassroomID() {
        return classroomID;
    }

    public void setClassroomID(int classroomID) {
        this.classroomID = classroomID;
    }

    public int getNumberOfTables() {
        return numberOfTables;
    }

    public void setNumberOfTables(int numberOfTables) {
        this.numberOfTables = numberOfTables;
    }

    public int getNumberOfChairs() {
        return numberOfChairs;
    }

    public void setNumberOfChairs(int numberOfChairs) {
        this.numberOfChairs = numberOfChairs;
    }

    public int getNumberOfLights() {
        return numberOfLights;
    }

    public void setNumberOfLights(int numberOfLights) {
        this.numberOfLights = numberOfLights;
    }

    public int getNumberOfProjectors() {
        return numberOfProjectors;
    }

    public void setNumberOfProjectors(int numberOfProjectors) {
        this.numberOfProjectors = numberOfProjectors;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
