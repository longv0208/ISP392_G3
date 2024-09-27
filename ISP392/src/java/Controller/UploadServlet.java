package Controller;

import Context.DBContext;
import DAO.DAO;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.text.SimpleDateFormat;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Câu lệnh SQL chèn dữ liệu vào bảng Users và Profile (thêm cột ID và Major)
    private static final String SQL_INSERT_USER = "INSERT INTO Users (id, username, email, password, role, status) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SQL_INSERT_PROFILE = "INSERT INTO Profile (user_id, full_name, date_of_birth, phone_number, address, gender, profile_picture, bio) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_INSERT_STUDENT_PROFILE = "INSERT INTO Student_Profile (student_id, major_id, year_of_study) VALUES (?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        HttpSession session = request.getSession(false);
        Connection connection = null;  // Declare connection outside the try block
        // 1. Check if session exists and if the user is logged in
        if (session == null || session.getAttribute("role") == null) {
            // Redirect to login page if no session or userRole is found
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Check if the user has the admin role (assuming admin role is represented by 1)
        int urole = (int) session.getAttribute("role");
        if (urole != 0) {
            // Send a 403 Forbidden error if the user is not admin
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have permission to access this page.");
            return;
        }
        try {
            Part filePart = request.getPart("file"); // Lấy file từ form
            InputStream inputStream = filePart.getInputStream();
            DAO dao = new DAO();
            XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
            XSSFSheet sheet = workbook.getSheetAt(0);
            try  {
                connection = new DBContext().getConnection();
                // Begin transaction
                connection.setAutoCommit(false);  // Disable auto-commit to control the transaction manually
                for (Row row : sheet) {
                    if (row.getRowNum() == 0) {
                        // Bỏ qua dòng tiêu đề
                        continue;
                    }
                    // Check if the row is empty (skip empty rows)
                    if (isRowEmpty(row)) {
                        System.out.println("Skipping empty row: " + row.getRowNum());
                        continue; // Skip to the next row if this one is empty
                    }
                    // Đọc dữ liệu từ file Excel
                    String idStr = getCellValue(row.getCell(0));
                    int id = (idStr != null && !idStr.trim().isEmpty()) ? (int) Float.parseFloat(idStr) : 0;  // Handle empty cell

                    // Handle other fields
                    String username = getCellValue(row.getCell(1)); // Cột Username
                    String email = getCellValue(row.getCell(2));    // Cột Email
                    String password = getCellValue(row.getCell(3)); // Cột Password

                    // Handle Role as a String (no need to parse it as an integer)
                    String role = getCellValue(row.getCell(4)); // Cột Role (String type)
                    role = role.toLowerCase();
                    System.out.println("Row " + row.getRowNum() + " - Role: " + role);
                    String status = getCellValue(row.getCell(5));   // Cột Status
                    status = status.toLowerCase();
                    String fullName = getCellValue(row.getCell(6)); // Cột Full Name

                    // Safely handle Date of Birth
                    Date javaDate = null;
                    String dateStr = getCellValue(row.getCell(7));
                    if (dateStr != null && !dateStr.trim().isEmpty()) {
                        try {
                            javaDate = DateUtil.getJavaDate(Float.parseFloat(dateStr));  // Convert to Java Date
                        } catch (NumberFormatException e) {
                            // Handle invalid date format (set default date or handle differently)
                            javaDate = new Date(); // Use current date as default
                        }
                    } else {
                        // Handle empty or null date (set default or skip row)
                        javaDate = new Date(); // Default to current date
                    }

                    // Format the date into SQL-compatible format
                    SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy/MM/dd");
                    String dateOfBirth = sqlFormat.format(javaDate); // Cột Date of Birth

                    // Handle phone number
                    String phoneNumber = dao.getCellValue(row.getCell(8));  // Cột Phone Number (you may also check for empty)

                    // Handle other fields (address, gender, profile picture, bio)
                    String address = getCellValue(row.getCell(9));       // Cột Address
                    String gender = getCellValue(row.getCell(10));       // Cột Gender
                    String profilePicture = getCellValue(row.getCell(11));  // Cột Profile Picture
                    String bio = getCellValue(row.getCell(12));          // Cột Bio

                    // Handle Major (numeric field)
                    String majorStr = getCellValue(row.getCell(13));
                    int major = (majorStr != null && !majorStr.trim().isEmpty()) ? (int) Float.parseFloat(majorStr) : 0;  // Cột Major

                    // Handle Year of Study
                    String year_of_study = getCellValue(row.getCell(14));  // Cột Year of Study (you may want to handle empty case here too)

                    // Chèn dữ liệu vào bảng Users
                    PreparedStatement userStmt = connection.prepareStatement(SQL_INSERT_USER);
                    userStmt.setInt(1, id);  // ID
                    userStmt.setString(2, username); // Username
                    userStmt.setString(3, email); // Email
                    userStmt.setString(4, password); // Password
                    userStmt.setString(5, role); // Role
                    userStmt.setString(6, status); // Status
                    userStmt.executeUpdate();

                    // Chèn dữ liệu vào bảng Profile
                    PreparedStatement profileStmt = connection.prepareStatement(SQL_INSERT_PROFILE);
                    profileStmt.setInt(1, id); // ID (được chèn vào user_id trong bảng Profile)
                    profileStmt.setString(2, fullName); // Full Name
                    profileStmt.setString(3, dateOfBirth); // Date of Birth
                    profileStmt.setString(4, phoneNumber); // Phone Number
                    profileStmt.setString(5, address); // Address
                    profileStmt.setString(6, gender); // Gender
                    profileStmt.setString(7, profilePicture); // Profile Picture
                    profileStmt.setString(8, bio); // Bio
                    profileStmt.executeUpdate();

                    //Chen du lieu vao bang student_profile
                    PreparedStatement studentprofileStmt = connection.prepareStatement(SQL_INSERT_STUDENT_PROFILE);
                    studentprofileStmt.setInt(1, id);
                    studentprofileStmt.setInt(2, major);
                    studentprofileStmt.setString(3, year_of_study);
                    studentprofileStmt.executeUpdate();
                }
                connection.commit();
                workbook.close();
                response.sendRedirect("homepage.jsp?status=success");
            } catch (Exception e) {
                // If any error occurs, roll back the transaction
                if (connection != null) {
                    try {
                        connection.rollback();
                        System.out.println("Transaction rolled back due to error.");
                    } catch (SQLServerException rollbackEx) {
                        rollbackEx.printStackTrace();
                    }
                }
                // Log the error and notify the user
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error processing file: " + e.getMessage());
                request.getRequestDispatcher("import.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing file: " + e.getMessage());
            request.getRequestDispatcher("import.jsp").forward(request, response);
        }
    }

    // Helper method to check if a row is empty
    private boolean isRowEmpty(Row row) {
        for (int cellNum = row.getFirstCellNum(); cellNum < row.getLastCellNum(); cellNum++) {
            Cell cell = row.getCell(cellNum);
            if (cell != null && cell.getCellType() != CellType.BLANK && !getCellValue(cell).trim().isEmpty()) {
                return false;  // The row has at least one non-empty cell
            }
        }
        return true;  // All cells are empty
    }

    private String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue());
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            default:
                return "";
        }
    }
}
