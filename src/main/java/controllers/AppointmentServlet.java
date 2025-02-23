package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DBConnection;

@WebServlet("/Appointments")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST request (booking or cancelling appointments)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            bookAppointment(request, response);
        } else if ("cancel".equals(action)) {
            cancelAppointment(request, response);
        } else {
            response.sendRedirect("/medicare/index.jsp");
        }
    }

    // Book an appointment
    private void bookAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String appointmentDate = request.getParameter("appointmentDate");
        String reason = request.getParameter("reason");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason, status) VALUES (?, ?, ?, ?, 'Scheduled')";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, patientId);
            stmt.setInt(2, doctorId);
            stmt.setString(3, appointmentDate);
            stmt.setString(4, reason);

            stmt.executeUpdate();
            response.sendRedirect("/medicare/viewAppointments.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error booking appointment.");
            request.getRequestDispatcher("/bookAppointment.jsp").forward(request, response);
        } finally {
            closeResources(stmt, conn);
        }
    }

    // Cancel an appointment
    private void cancelAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE Appointments SET status = 'Cancelled' WHERE appointment_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, appointmentId);

            stmt.executeUpdate();
            response.sendRedirect("/medicare/viewAppointments.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error cancelling appointment.");
            request.getRequestDispatcher("/cancelAppointment.jsp").forward(request, response);
        } finally {
            closeResources(stmt, conn);
        }
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
