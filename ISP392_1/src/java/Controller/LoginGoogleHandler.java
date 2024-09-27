package Controller;

import DAO.DAO;
import Model.Constants;
import Model.User;
import Model.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginGoogleHandler extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LoginGoogleHandler.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String code = request.getParameter("code");

        try {
            // Retrieve access token from Google
            String accessToken = getToken(code);
            UserGoogleDto googleUser = getUserInfo(accessToken);

            // Check if the user exists in the organization's database
            List<User> users = dao.getAllUser();
            User matchedUser = null;
            for (User user : users) {
                if (googleUser.getEmail().equalsIgnoreCase(user.getEmail())) {
                    matchedUser = user;
                    break;
                }
            }

            // If user exists, set role and redirect to home
            if (matchedUser != null) {
                HttpSession session = request.getSession();
                String role = matchedUser.getRole();
                session.setAttribute("user", matchedUser.getId());
                // Set role in session based on user role
                if ("student".equalsIgnoreCase(role)) {
                    session.setAttribute("role", 1);
                } else if ("lecturer".equalsIgnoreCase(role)) {
                    session.setAttribute("role", 2);
                } else if ("admin".equalsIgnoreCase(role)) {
                    session.setAttribute("role", 0);
                } else {
                    // Handle unknown role (log an error if needed)
                    session.setAttribute("role", -1);
                    LOGGER.log(Level.WARNING, "Unknown role for user {0}", matchedUser.getEmail());
                }

                // Redirect to home after login
                response.sendRedirect("home");

            } else {
                // If user not found, redirect to login page with error
                HttpSession session = request.getSession();
                session.setAttribute("loginfail", "Account not in organization");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            // Log the error and redirect to the login page with an error message
            LOGGER.log(Level.SEVERE, "Error during Google login", e);
            HttpSession session = request.getSession();
            session.setAttribute("loginfail", "Error occurred during login: " + e.getMessage());
            response.sendRedirect("login.jsp");
        }
    }

    /**
     * Retrieves the access token from Google's OAuth service using the
     * authorization code.
     */
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                        .build())
                .execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);
        return jsonObject.get("access_token").getAsString();
    }

    /**
     * Retrieves user information from Google using the access token.
     */
    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDto.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Google Login Handler";
    }
}
