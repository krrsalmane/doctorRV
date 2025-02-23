package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.DBConnection;
import models.Appointment;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests to view patient appointments
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer patientId = (Integer) session.getAttribute("patientId");

        if (patientId != null) {
            List<Appointment> appointments = getAppointmentsByPatient(patientId);
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("/viewAppointments.jsp").forward(request, response);
        } else {
            response.sendRedirect("/medicare/index.jsp");
        }
    }

    // Handle POST requests (e.g., login)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            loginPatient(request, response);
        } else {
            response.sendRedirect("/medicare/index.jsp");
        }
    }

    // Patient login method
    private void loginPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT patient_id FROM Patients WHERE username = ? AND email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);

            rs = stmt.executeQuery();
            HttpSession session = request.getSession();

            if (rs.next()) {
                int patientId = rs.getInt("patient_id");
                session.setAttribute("patientId", patientId);
                response.sendRedirect("/medicare/viewAppointments.jsp");
            } else {
                request.setAttribute("error", "Invalid patient credentials.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } finally {
            closeResources(stmt, conn);
        }
    }

    // Helper method to get appointments for a patient
    private List<Appointment> getAppointmentsByPatient(int patientId) {
        List<Appointment> appointments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM Appointments WHERE patient_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Appointment appt = new Appointment();
                appt.setAppointmentId(rs.getInt("appointment_id"));
                appt.setPatientId(rs.getInt("patient_id"));
                appt.setDoctorId(rs.getInt("doctor_id"));
                appt.setAppointmentDate(rs.getString("appointment_date"));
                appt.setReason(rs.getString("reason"));
                appt.setStatus(rs.getString("status"));
                appointments.add(appt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(stmt, conn);
        }
        return appointments;
    }

    // Helper method to close database resources
    private void closeResources(PreparedStatement stmt, Connection conn) {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
