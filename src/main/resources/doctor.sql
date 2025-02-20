
CREATE DATABASE medicare;
USE medicare;

CREATE TABLE Patients (
                          patient_id INT AUTO_INCREMENT PRIMARY KEY,
                          username VARCHAR(50) UNIQUE NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          phone VARCHAR(15) NOT NULL
);
CREATE TABLE Doctors (
                         doctor_id INT AUTO_INCREMENT PRIMARY KEY,
                         username VARCHAR(100) NOT NULL,
                         department VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
                              appointment_id INT AUTO_INCREMENT PRIMARY KEY,
                              patient_id INT NOT NULL,
                              doctor_id INT NOT NULL,
                              appointment_date DATETIME NOT NULL,
                              FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ,
                              FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)) ;

