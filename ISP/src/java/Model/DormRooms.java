/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dell
 */
public class DormRooms {
    private int id;
    private String roomNumber;
    private int capacity;
    private int availableCapacity;
    private String building;
    private String roomType;

    // Constructor không tham số
    public DormRooms() {}

    // Constructor với tất cả các tham số
    public DormRooms(int id, String roomNumber, int capacity, int availableCapacity, String building, String roomType) {
        this.id = id;
        this.roomNumber = roomNumber;
        this.capacity = capacity;
        this.availableCapacity = availableCapacity;
        this.building = building;
        this.roomType = roomType;
    }

    // Getter và Setter cho các thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getAvailableCapacity() {
        return availableCapacity;
    }

    public void setAvailableCapacity(int availableCapacity) {
        this.availableCapacity = availableCapacity;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    // Phương thức toString để in thông tin đối tượng
    @Override
    public String toString() {
        return "DormRoom{" +
                "id=" + id +
                ", roomNumber='" + roomNumber + '\'' +
                ", capacity=" + capacity +
                ", availableCapacity=" + availableCapacity +
                ", building='" + building + '\'' +
                ", roomType='" + roomType + '\'' +
                '}';
    }
}
