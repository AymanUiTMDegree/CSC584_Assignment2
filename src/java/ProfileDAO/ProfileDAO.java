package ProfileDAO;

import Profile.Profile;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_db?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    // Standard parameterless constructor
    public ProfileDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * Inserts a newly registered user profile into the database
     */
    public void insertProfile(Profile profile) throws SQLException {
        // Enclosing table name in backticks to bypass MySQL reserved word restriction
        String sql = "INSERT INTO `profile` (studID, name, email, program, hobbies, bio, picture) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection(); 
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, profile.getStudID());
            statement.setString(2, profile.getName());
            statement.setString(3, profile.getEmail());
            statement.setString(4, profile.getProgram());
            statement.setString(5, profile.getHobbies());
            statement.setString(6, profile.getBio());
            statement.setString(7, profile.getPicture());
            
            statement.executeUpdate();
        }
    }

    /**
     * Selects and returns all registered student profiles from the database
     */
    public List<Profile> selectAllProfiles() {
        List<Profile> profiles = new ArrayList<>();
        // Enclosing table name in backticks to bypass MySQL reserved word restriction
        String sql = "SELECT * FROM `profile`";
        
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            
            while (rs.next()) {
                Profile profile = new Profile();
                profile.setStudID(rs.getInt("studID"));
                profile.setName(rs.getString("name"));
                profile.setEmail(rs.getString("email"));
                profile.setProgram(rs.getString("program"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setBio(rs.getString("bio"));
                profile.setPicture(rs.getString("picture"));
                
                profiles.add(profile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
}