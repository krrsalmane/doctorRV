package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.appointments.dao.DBConnection;
import com.appointments.models.Appointment;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer doctorId = (Integer) session.getAttribute("doctorId");

        if (doctorId != null) {
            // View doctor's appointments
            List<Appointment> appointments = getAppointmentsByDoctor(doctorId);
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("/doctorDashboard.jsp").forward(request, response);
        } else {
            response.sendRedirect("/MedicalAppointmentApp/index.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            loginDoctor(request, response);
        } else {
            response.sendRedirect("/MedicalAppointmentApp/index.jsp");
        }
    }

    private void loginDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT doctor_id FROM Doctors WHERE username = ? AND email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);

            rs = stmt.executeQuery();
            HttpSession session = request.getSession();

            if (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                session.setAttribute("doctorId", doctorId);
                response.sendRedirect("/MedicalAppointmentApp/doctorDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid doctor credentials.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private List<Appointment> getAppointmentsByDoctor(int doctorId) {
        List<Appointment> appointments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM Appointments WHERE doctor_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, doctorId);
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
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return appointments;
    }
}