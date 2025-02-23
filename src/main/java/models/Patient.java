package models;

public class Patient {
    private int patientId;
    private String username;
    private String email;
    private String phone;
    private String password;

    // Default constructor
    public Patient() {
    }

    // Parameterized constructor
    public Patient(int patientId, String username, String email, String phone, String password) {
        this.patientId = patientId;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    // Getters and Setters
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}