package dao;

import java.sql.*;

public class DoctorDAO {

    public boolean registerDoctor(String name, String specialty) {
        String query = "INSERT INTO doctors (name, specialty) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, specialty);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getDoctorById(int doctorId) {
        String query = "SELECT * FROM doctors WHERE doctor_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return "Dr. " + rs.getString("name") + " - " + rs.getString("specialty");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
