package models;

public class Doctor {
    private int doctorId;
    private String username;
    private String email;
    private String department;
    private String password;

    // Default constructor
    public Doctor() {
    }

    // Parameterized constructor
    public Doctor(int doctorId, String username, String email, String department, String password) {
        this.doctorId = doctorId;
        this.username = username;
        this.email = email;
        this.department = department;
        this.password = password;
    }

    // Getters and Setters
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}