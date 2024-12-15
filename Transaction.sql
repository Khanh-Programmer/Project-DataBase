use hospital_management_system;

START TRANSACTION;
INSERT INTO Bills (PatientID, TotalAmount, IssueDate, PaidStatus)
VALUES (1, 100.00, '2024-12-14', 'Unpaid');
SET @LastBillID = LAST_INSERT_ID();

INSERT INTO BillDetails (BillID, Description, Amount)
VALUES (@LastBillID, 'Consultation Fee', 50.00),
       (@LastBillID, 'Medicine Fee', 50.00);

INSERT INTO BillDetails (BillID, Description, Amount)
VALUES (@LastBillID, 'Overcharge Fee', 200.00);

COMMIT;
ROLLBACK;

START TRANSACTION;

INSERT INTO Patients (FullName, DateOfBirth, Gender, Address, PhoneNumber, Email, RoomID)
VALUES ('Trần Văn Nam', '1990-01-15', 'Male', 'Hà Nội, Việt Nam', '0988112233', 'namtran@gmail.com', 3);

SET @NewPatientID = LAST_INSERT_ID();

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason)
VALUES (@NewPatientID, 1, '2024-12-20 10:00:00', 'Routine checkup');

INSERT INTO Bills (PatientID, TotalAmount, IssueDate, PaidStatus)
VALUES (@NewPatientID, 150.00, '2024-12-20', 'Unpaid');
ROLLBACK;