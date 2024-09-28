/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import Model.DormRooms;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class DormRoomsDAO extends DBcontext {

    // Lấy tất cả các phòng dorm
    public List<DormRooms> getAllDormRooms() {
        List<DormRooms> dormRooms = new ArrayList<>();
        String query = "SELECT * FROM DormRooms";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DormRooms dormRoom = new DormRooms();
                dormRoom.setId(rs.getInt("id"));
                dormRoom.setRoomNumber(rs.getString("room_number"));
                dormRoom.setCapacity(rs.getInt("capacity"));
                dormRoom.setAvailableCapacity(rs.getInt("available_capacity"));
                dormRoom.setBuilding(rs.getString("building"));
                dormRoom.setRoomType(rs.getString("room_type"));

                dormRooms.add(dormRoom);
            }
        } catch (Exception e) {
            System.out.println("Get dorm:" + e.getMessage());;
        }
        return dormRooms;
    }

    // Lấy phòng dorm theo ID
    public DormRooms getDormRoomById(int id) {
        DormRooms dormRoom = null;
        String query = "SELECT * FROM DormRooms WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dormRoom = new DormRooms();
                dormRoom.setId(rs.getInt("id"));
                dormRoom.setRoomNumber(rs.getString("room_number"));
                dormRoom.setCapacity(rs.getInt("capacity"));
                dormRoom.setAvailableCapacity(rs.getInt("available_capacity"));
                dormRoom.setBuilding(rs.getString("building"));
                dormRoom.setRoomType(rs.getString("room_type"));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return dormRoom;
    }

    // Thêm phòng dorm mới
    public void insertDormRoom(DormRooms dormRoom) {
        String query = "INSERT INTO DormRooms (room_number, capacity, available_capacity, building, room_type) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, dormRoom.getRoomNumber());
            ps.setInt(2, dormRoom.getCapacity());
            ps.setInt(3, dormRoom.getAvailableCapacity());
            ps.setString(4, dormRoom.getBuilding());
            ps.setString(5, dormRoom.getRoomType());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    // Cập nhật phòng dorm
    public void updateDormRoom(DormRooms dormRoom) {
        String query = "UPDATE DormRooms SET room_number = ?, capacity = ?, available_capacity = ?, building = ?, room_type = ? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, dormRoom.getRoomNumber());
            ps.setInt(2, dormRoom.getCapacity());
            ps.setInt(3, dormRoom.getAvailableCapacity());
            ps.setString(4, dormRoom.getBuilding());
            ps.setString(5, dormRoom.getRoomType());
            ps.setInt(6, dormRoom.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("update: "+ e.getMessage());
        }
    }

    // Xóa phòng dorm theo ID
    public void deleteDormRoom(int id) {
        String query = "DELETE FROM DormRooms WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     // Hàm main để kiểm tra việc lấy dữ liệu từ database
    public static void main(String[] args) {
        DormRoomsDAO dao = new DormRoomsDAO();
        List<DormRooms> dormRooms = dao.getAllDormRooms();

        // Kiểm tra và in ra kết quả
        if (dormRooms != null && !dormRooms.isEmpty()) {
            System.out.println("Dữ liệu đã lấy thành công:");
            for (DormRooms dormRoom : dormRooms) {
                System.out.println("ID: " + dormRoom.getId());
                System.out.println("Room Number: " + dormRoom.getRoomNumber());
                System.out.println("Capacity: " + dormRoom.getCapacity());
                System.out.println("Available Capacity: " + dormRoom.getAvailableCapacity());
                System.out.println("Building: " + dormRoom.getBuilding());
                System.out.println("Room Type: " + dormRoom.getRoomType());
                System.out.println("-------------------------------");
            }
        } else {
            System.out.println("Không có dữ liệu nào được tìm thấy.");
        }
    }
}