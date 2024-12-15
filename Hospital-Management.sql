create database Hospital_Management_System;

use Hospital_Management_System;

-- Bảng lưu thông tin bác sĩ
create table Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE NOT NULL
);

-- Bảng lưu thông tin nhân viên
create table Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DoctorID INT NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE NOT NULL,
    FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID)
);

-- Bảng lưu thông tin phòng bệnh
create table Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType ENUM('General', 'Private', 'ICU') NOT NULL,
    Capacity INT NOT NULL,
    AvailabilityStatus ENUM('Available', 'Occupied') NOT NULL
);

create table Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    RoomID INT NOT NULL,
    FOREIGN KEY(RoomID) REFERENCES Rooms(RoomID)
);


-- Bảng lưu lịch khám bệnh
create table Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Bảng lưu thông tin thuốc
create table Medicines (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL
);

-- Bảng lưu đơn thuốc
create table Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    IssueDate DATE NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Bảng lưu chi tiết đơn thuốc
create table PrescriptionDetails (
    PrescriptionDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PrescriptionID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- Bảng lưu hóa đơn
create table Bills (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    IssueDate DATE NOT NULL,
    PaidStatus ENUM('Paid', 'Unpaid') NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Bảng lưu chi tiết hóa đơn
create table BillDetails (
    BillDetailID INT AUTO_INCREMENT PRIMARY KEY,
    BillID INT NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BillID) REFERENCES Bills(BillID)
);
