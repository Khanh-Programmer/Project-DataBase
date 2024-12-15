use hospital_management_system;
DELIMITER $$
CREATE PROCEDURE CreateBill(
    IN p_PatientID INT,
    IN p_TotalAmount DECIMAL(10, 2),
    IN p_IssueDate DATE,
    IN p_PaidStatus ENUM('Paid', 'Unpaid'),
    IN p_Description1 VARCHAR(255),
    IN p_Amount1 DECIMAL(10, 2),
    IN p_Description2 VARCHAR(255),
    IN p_Amount2 DECIMAL(10, 2)
)
BEGIN
    DECLARE newBillID INT;

    INSERT INTO Bills (PatientID, TotalAmount, IssueDate, PaidStatus)
    VALUES (p_PatientID, p_TotalAmount, p_IssueDate, p_PaidStatus);

    SET newBillID = LAST_INSERT_ID();
    INSERT INTO BillDetails (BillID, Description, Amount)
    VALUES (newBillID, p_Description1, p_Amount1),
           (newBillID, p_Description2, p_Amount2);

END $$

-- Procedure này dùng để thêm thông tin bác sĩ mới vào cơ sở dữ liệu.

CREATE PROCEDURE AddDoctor (
    IN p_FullName VARCHAR(100),
    IN p_Specialty VARCHAR(100),
    IN p_PhoneNumber VARCHAR(15),
    IN p_Email VARCHAR(100),
    IN p_HireDate DATE
)
BEGIN
    INSERT INTO Doctors (FullName, Specialty, PhoneNumber, Email, HireDate)
    VALUES (p_FullName, p_Specialty, p_PhoneNumber, p_Email, p_HireDate);
END $$

-- Procedure này dùng để thêm thông tin bệnh nhân mới vào cơ sở dữ liệu.
CREATE PROCEDURE AddPatient (
    IN p_FullName VARCHAR(100),
    IN p_DateOfBirth DATE,
    IN p_Gender ENUM('Male', 'Female', 'Other'),
    IN p_Address VARCHAR(255),
    IN p_PhoneNumber VARCHAR(15),
    IN p_Email VARCHAR(100),
    IN p_Room INT
)
BEGIN
    INSERT INTO Patients (FullName, DateOfBirth, Gender, Address, PhoneNumber, Email, RoomID)
    VALUES (p_FullName, p_DateOfBirth, p_Gender, p_Address, p_PhoneNumber, p_Email, p_Room);
END $$
-- Procedure này tính tổng số tiền chưa thanh toán từ bảng hóa đơn và trả về kết quả.
CREATE PROCEDURE GetUnpaidBills (
    OUT p_TotalUnpaid DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(TotalAmount)
    INTO p_TotalUnpaid
    FROM Bills
    WHERE PaidStatus = 'Unpaid';
END $$
DELIMITER ;

# Gọi thủ tục :
CALL CreateBill(1, 100.00, '2024-12-14', 'Unpaid', 'Consultation Fee', 50.00, 'Medicine Fee', 50.00);
-- Gọi thủ tục AddDoctor
CALL AddDoctor('Nguyễn Văn Hưng', 'Cardiology', '0912345678', 'hungnv@gmail.com', '2022-05-01');

-- Gọi thủ tục AddPatient
CALL AddPatient('Lê Thị Mai', '1995-08-15', 'Female', 'Hải Phòng, Việt Nam', '0934556677', 'maile@gmail.com', 6);

-- Gọi thủ tục GetUnpaidBills
SET @UnpaidAmount = 0;
CALL GetUnpaidBills(@UnpaidAmount);
SELECT @UnpaidAmount AS Total_Unpaid_Amount;
