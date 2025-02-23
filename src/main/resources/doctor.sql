CREATE DATABASE medicare;
USE medicare;

CREATE TABLE Patients (
                          patient_id INT AUTO_INCREMENT PRIMARY KEY,
                          username VARCHAR(50) NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          phone VARCHAR(15) NOT NULL,
                          password VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
                         doctor_id INT AUTO_INCREMENT PRIMARY KEY,
                         username VARCHAR(50) NOT NULL,
                         email VARCHAR(100) NOT NULL, -- Added to match JSP
                         department VARCHAR(100) NOT NULL,
                         password VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
                              appointment_id INT AUTO_INCREMENT PRIMARY KEY,
                              patient_id INT NOT NULL,
                              doctor_id INT NOT NULL,
                              appointment_date DATETIME NOT NULL,
                              reason VARCHAR(200) NOT NULL,
                              status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
                              FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
                              FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);