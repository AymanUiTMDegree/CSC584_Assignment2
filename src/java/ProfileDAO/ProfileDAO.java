package ProfileDAO;

import Profile.Profile;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_db?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

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

    public void insertProfile(Profile profile) throws SQLException {
        String sql = "INSERT INTO profile (studID, name, email, program, hobbies, bio, picture) VALUES (?, ?, ?, ?, ?, ?, ?)";
       
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

    public List<Profile> selectAllProfiles() {
        List<Profile> profiles = new ArrayList<>();
        String sql = "SELECT * FROM profile";
        
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
    
    public void deleteProfile(int studID) throws SQLException {
        String sql = "DELETE FROM profile WHERE studID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, studID);
            statement.executeUpdate();
        }
    }

    public Profile getProfile(int studID) {
        Profile profile = null;
        String sql = "SELECT * FROM profile WHERE studID = ?";
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, studID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    profile = new Profile();
                    profile.setStudID(rs.getInt("studID"));
                    profile.setName(rs.getString("name"));
                    profile.setEmail(rs.getString("email"));
                    profile.setProgram(rs.getString("program"));
                    profile.setHobbies(rs.getString("hobbies"));
                    profile.setBio(rs.getString("bio"));
                    profile.setPicture(rs.getString("picture"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profile;
    }

    public void updateProfile(Profile profile) throws SQLException {
        String sql = "UPDATE profile SET name=?, email=?, program=?, hobbies=?, bio=? WHERE studID=?";
        try (Connection conn = getConnection(); 
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, profile.getName());
            statement.setString(2, profile.getEmail());
            statement.setString(3, profile.getProgram());
            statement.setString(4, profile.getHobbies());
            statement.setString(5, profile.getBio());
            statement.setInt(6, profile.getStudID());
            statement.executeUpdate();
        }
    }
}