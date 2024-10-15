package VNPay;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet to handle VNPay payment request
 */
public class VNPayServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy các tham số từ form
        String amount = request.getParameter("amount"); // Số tiền nạp
        String orderId = Config.getRandomNumber(8); // Tạo OrderId ngẫu nhiên
        String ipAddress = Config.getIpAddress(request); // Lấy địa chỉ IP của người dùng
        String vnp_TxnRef = orderId; // Sử dụng orderId làm mã giao dịch

        // Tạo thông tin thanh toán
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", "2.1.0");
        vnp_Params.put("vnp_Command", "pay");
        vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(Integer.parseInt(amount) * 100)); // Đổi sang đơn vị nhỏ nhất
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Nap tien cho giao dich " + orderId);
        vnp_Params.put("vnp_OrderType", "other"); // Loại thanh toán, bạn có thể thay đổi tùy nhu cầu
        vnp_Params.put("vnp_Locale", "vn"); // Ngôn ngữ tiếng Việt
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", ipAddress);

        // Lấy thời gian hiện tại để tạo thời gian giao dịch
        String vnp_CreateDate = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        // Lấy URL đã mã hóa tất cả các tham số
        String queryUrl = buildQueryString(vnp_Params);
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        // Chuyển hướng người dùng đến cổng thanh toán VNPay
        response.sendRedirect(paymentUrl);
    }

    private String buildQueryString(Map<String, String> vnp_Params) throws UnsupportedEncodingException {
        // Sắp xếp các tham số theo thứ tự bảng chữ cái và tạo URL
        StringBuilder queryBuilder = new StringBuilder();
        String secureHash = Config.hashAllFields(vnp_Params); // Mã hóa các tham số để tạo secure hash
        vnp_Params.put("vnp_SecureHash", secureHash); // Thêm mã bảo mật vào cuối

        for (Map.Entry<String, String> param : vnp_Params.entrySet()) {
            if (queryBuilder.length() > 0) {
                queryBuilder.append("&");
            }
            queryBuilder.append(URLEncoder.encode(param.getKey(), "UTF-8"))
                         .append("=")
                         .append(URLEncoder.encode(param.getValue(), "UTF-8"));
        }

        return queryBuilder.toString();
    }
}
