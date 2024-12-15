use hospital_management_system;

insert into Rooms (RoomID ,RoomNumber, RoomType, Capacity, AvailabilityStatus)
values (1,'101', 'General', 2, 'Available'),
       (2,'102', 'Private', 1, 'Occupied'),
       (3,'103', 'ICU', 1, 'Available'),
       (4,'104', 'General', 2, 'Available'),
       (5,'205', 'Private', 1, 'Occupied'),
       (6,'106', 'General', 2, 'Available'),
       (7,'307', 'ICU', 1, 'Occupied'),
       (8,'108', 'General', 2, 'Available'),
       (9,'109', 'Private', 1, 'Available'),
       (10,'310', 'General', 2, 'Occupied');

insert into Patients (FullName, DateOfBirth, Gender, Address, PhoneNumber, Email, RoomID)
values ('Nguyễn Thị Ly', '1995-05-15', 'Female', 'Hà Nội, Việt Nam', '0987654321', 'lynguyen@gmail.com', 1),
       ('Trần Khánh Toàn', '1985-03-20', 'Male', 'Hồ Chí Minh , Việt Nam', '0912345678', 'toantran@gmail.com', 1),
       ('Hoàng Thị Loan', '2000-08-10', 'Female', 'Đà Nẵng, Việt Nam', '0932112233', 'loan123@gmail.com', 2),
       ('Trần Minh Duy', '1992-07-25', 'Male', 'Thái Bình, Việt Nam', '0988776655', 'duytran1992@gmail.com', 4),
       ('Nguyễn Minh Tuấn', '1988-02-14', 'Male', 'Hưng Yên, Vietnam', '0902345678', 'tuannguyen1988@gmail.com', 5),
       ('Trần Thị Mai', '1995-12-30', 'Female', 'Nghệ An, Việt Nam', '0967554433', 'mai567@gmail.com', 6),
       ('Nguyễn Thị Lan Anh', '2002-09-15', 'Female', 'Hải Dương, Việt Nam', '0977223344', 'lananh0303@gmail.com', 7),
       ('Nguyễn Minh Quang', '1986-01-10', 'Male', 'Thanh Hóa, Việt Nam', '0911887766', 'quangnguyen1986@gmail.com', 8),
       ('Nguyễn Thị Mai', '1999-04-05', 'Female', 'Huế, Việt Nam', '0944556677', 'mainguyen234@gmail.com', 10),
       ('Nguyễn Thái Sơn ', '1993-11-19', 'Male', 'Nam Định, Việt Nam', '0901223344', 'sonnguyen123@gmail.com', 10);

insert into Doctors (FullName, Specialty, PhoneNumber, Email, HireDate)
values ('Mr.Nguyễn Hữu Trình', 'Cardiologist', '0968736655', 'trinhnguyen03@hospital.com', '2020-01-10'),
       ('Mr. Trần Minh Hoàng', 'Dermatologist', '0912345678', 'hoangtran98@hospital.com', '2019-07-15'),
       ('Mrs. Vũ Thị Mai', 'Neurologist', '0932112233', 'maivu24@hospital.com', '2021-08-20'),
       ('Mr. Phạm Tiến Minh', 'Orthopedic', '0987654321', 'minhpham68@hospital.com', '2022-03-10'),
       ('Mr. Nguyễn Văn Tuấn', 'Pediatrician', '0902345678', 'tuannguyen78@hospital.com', '2018-12-01'),
       ('Mrs. Nguyễn Phương Linh', 'Surgeon', '0967554433', 'linhnguyen23@hospital.com', '2021-06-25'),
       ('Mrs. Nguyễn Thu Phương', 'General Practitioner', '0977223344', 'phuongnguyen12@hospital.com', '2020-09-10'),
       ('Mr. Nguyễn Khánh Duy', 'Dentist', '0911887766', 'duynguyen88@hospital.com', '2017-05-17'),
       ('Mr. Nguyễn Khánh Huyền', 'Ophthalmologist', '0944556677', 'khanhuyen234@hospital.com', '2022-02-05'),
       ('Mr. Nguyễn Thanh Sơn', 'Endocrinologist', '0901223344', 'sonnguyen@hospital.com', '2019-04-22');

INSERT INTO Staff (FullName, DoctorID, PhoneNumber, Email, HireDate)
values ('Nguyễn Thị Mai', 1, '0988776655', 'mainurse@hospital.com', '2018-01-10'),
       ('Trần Minh Hoàng', 2, '0912345678', 'receptionist@hospital.com', '2017-02-20'),
       ('Lê Thị Lan', 3, '0932112233', 'labtech@hospital.com', '2020-08-05'),
       ('Phạm Quốc Duy', 4, '0987654321', 'pharmacist@hospital.com', '2019-03-15'),
       ('Nguễn Tuấn Minh', 5, '0902345678', 'admin@hospital.com', '2021-12-12'),
       ('Nguyễn Phương Lan', 6, '0967554433', 'physio@hospital.com', '2020-06-10'),
       ('Phạm Lan Anh', 7, '0977223344', 'billing@hospital.com', '2021-11-20'),
       ('Bùi Minh Quang', 8, '0911887766', 'security@hospital.com', '2018-07-17'),
       ('Vũ Thị Mai', 9, '0944556677', 'medrecords@hospital.com', '2019-02-25'),
       ('Bùi Thái Sơn', 10, '0901223344', 'cleaner@hospital.com', '2022-03-01');

insert into Appointments (PatientID, DoctorID, AppointmentDate, Reason)
values (1, 1, '2024-08-15 08:00:00', 'Heart checkup'),
       (2, 2, '2024-02-08 09:30:00', 'Skin rash'),
       (3, 3, '2024-04-12 10:00:00', 'Migraine'),
       (4, 4, '2024-06-13 11:15:00', 'Joint pain'),
       (5, 5, '2024-03-11 14:30:00', 'Routine checkup'),
       (6, 6, '2024-02-20 15:00:00', 'Physiotherapy'),
       (7, 7, '2024-05-18 16:30:00', 'General checkup'),
       (8, 8, '2024-07-25 17:00:00', 'Dental issue'),
       (9, 9, '2024-01-05 09:30:00', 'Vision problems'),
       (10, 10, '2024-12-20 11:00:00', 'Thyroid test');

insert into Medicines (MedicineName, Description, Price)
values ('Paracetamol', 'Pain reliever', 5.00),
       ('Amoxicillin', 'Antibiotic', 10.00),
       ('Ibuprofen', 'Anti-inflammatory', 8.00),
       ('Aspirin', 'Pain reliever', 6.50),
       ('Metformin', 'Diabetes medication', 12.00),
       ('Ciprofloxacin', 'Antibiotic', 15.00),
       ('Cetirizine', 'Antihistamine', 7.00),
       ('Lisinopril', 'Blood pressure medication', 20.00),
       ('Simvastatin', 'Cholesterol medication', 25.00),
       ('Omeprazole', 'Antacid', 10.50);

insert into Prescriptions (AppointmentID, IssueDate)
values (1, '2024-12-15'),
       (2, '2024-12-16'),
       (3, '2024-12-17'),
       (4, '2024-12-18'),
       (5, '2024-12-19'),
       (6, '2024-12-20'),
       (7, '2024-12-21'),
       (8, '2024-12-22'),
       (9, '2024-12-23'),
       (10, '2024-12-24');

insert into PrescriptionDetails (PrescriptionID, MedicineID, Quantity)
values (1, 1, 10),
       (1, 3, 5),
       (2, 2, 7),
       (2, 4, 8),
       (3, 5, 3),
       (3, 6, 2),
       (4, 7, 10),
       (4, 8, 4),
       (5, 9, 5),
       (5, 10, 6);

insert into Bills (PatientID, TotalAmount, IssueDate, PaidStatus)
values (1, 100.00, '2024-12-15', 'Unpaid'),
       (2, 80.00, '2024-12-16', 'Paid'),
       (3, 70.00, '2024-12-17', 'Unpaid'),
       (4, 90.00, '2024-12-18', 'Unpaid'),
       (5, 50.00, '2024-12-19', 'Paid'),
       (6, 75.00, '2024-12-20', 'Unpaid'),
       (7, 60.00, '2024-12-21', 'Paid'),
       (8, 110.00, '2024-12-22', 'Unpaid'),
       (9, 85.00, '2024-12-23', 'Paid'),
       (10, 95.00, '2024-12-24', 'Unpaid');

insert into BillDetails (BillID, Description, Amount)
values (1, 'Consultation Fee', 30.00),
       (1, 'Medicine Fee', 20.00),
       (2, 'Consultation Fee', 25.00),
       (2, 'Medicine Fee', 15.00),
       (3, 'Consultation Fee', 40.00),
       (3, 'Medicine Fee', 30.00),
       (4, 'Consultation Fee', 35.00),
       (4, 'Medicine Fee', 25.00),
       (5, 'Consultation Fee', 20.00),
       (5, 'Medicine Fee', 30.00);
