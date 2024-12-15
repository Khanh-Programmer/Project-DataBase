use hospital_management_system;

# Sử dụng INNER JOIN :
select a.AppointmentID, p.FullName AS Patient_Name, d.FullName AS Doctor_Name, a.AppointmentDate
from Appointments a
         inner join Patients p on a.PatientID = p.PatientID
         inner join Doctors d ON a.DoctorID = d.DoctorID;
-- Truy vấn này đếm số lượng lịch hẹn cho từng bác sĩ bằng cách sử dụng INNER JOIN.
SELECT d.FullName AS Doctor_Name, COUNT(a.AppointmentID) AS Total_Appointments
FROM Doctors d
         INNER JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.FullName
ORDER BY Total_Appointments DESC;

# Sử dụng OUTER JOIN :
select p.FullName AS Patient_Name, a.AppointmentDate
from Patients p
         left outer join Appointments a ON p.PatientID = a.PatientID;
-- Truy vấn này sử dụng LEFT OUTER JOIN để liệt kê tất cả bệnh nhân cùng với ngày hẹn (nếu có).
SELECT p.FullName AS Patient_Name, COALESCE(a.AppointmentDate, 'No Appointment') AS Appointment_Date
FROM Patients p
         LEFT OUTER JOIN Appointments a ON p.PatientID = a.PatientID
ORDER BY Patient_Name;


# Sử dụng SUBQUERY trong WHERE :
select d.FullName
from Doctors d
where d.DoctorID IN (select a.DoctorID
                     from Appointments a
                     where a.AppointmentDate between '2024-02-20' AND '2024-05-18');
-- Truy vấn này sử dụng subquery để tìm các bác sĩ liên quan đến lịch hẹn kiểm tra sức khỏe.
SELECT FullName, Email
FROM Doctors
WHERE DoctorID IN (
    SELECT DoctorID
    FROM Appointments
    WHERE Reason LIKE '%checkup%'
);

# Sử dụng SUBQUERY trong FROM :
select d.FullName AS DoctorName, count(a.PatientID) AS Patient_Amount
from Doctors d
         join (select PatientID, DoctorID
               from Appointments
               where AppointmentDate between '2024-07-25' and '2024-12-20') a on d.DoctorID = a.DoctorID
group by d.FullName;
-- Truy vấn này sử dụng subquery trong FROM để tính chi phí trung bình của thuốc trong hóa đơn.
SELECT AVG(MedicineCost) AS Avg_Medicine_Cost
FROM (
         SELECT b.BillID, SUM(ms.Amount) AS MedicineCost
         FROM Bills b
                  JOIN BillDetails ms ON b.BillID = ms.BillID AND ms.Description = 'Medicine Fee'
         GROUP BY b.BillID
     ) AS MedicineSummary;


# Sử dụng GROUP BY và hàm tổng hợp :
select p.FullName AS PatientName, SUM(b.TotalAmount) AS Total_Amount
from Bills b
         join Patients p on b.PatientID = p.PatientID
group by p.FullName;
-- Truy vấn này nhóm theo loại phòng để đếm số lượng phòng và tổng sức chứa của từng loại.
SELECT r.RoomType, COUNT(r.RoomID) AS Total_Rooms, SUM(r.Capacity) AS Total_Capacity
FROM Rooms r
GROUP BY r.RoomType
ORDER BY Total_Capacity DESC;

# Query add :
select p.PatientID,
       p.FullName                        AS Patient_Name,
       p.DateOfBirth                     AS DOB,
       p.Gender,
       p.PhoneNumber                     AS Patient_Phone,
       p.Email                           AS Patient_Email,
       d.FullName                        AS Doctor_Name,
       r.RoomNumber                      AS Room,
       b.BillID,
       b.TotalAmount                     AS Total_Bill_Amount,
       b.IssueDate,
       b.PaidStatus,
       SUM(bs.Amount)                    AS Total_ServiceCost,
       SUM(ms.Amount)                    AS Total_MedicineCost,
       COUNT(pd.PrescriptionID)          AS Prescription_Count,
       COUNT(a.AppointmentID)            AS Appointment_Count,
       -- Tính tổng chi phí (dịch vụ + thuốc)
       (SUM(bs.Amount) + SUM(ms.Amount)) AS GrandTotal
from Patients p
         join
     Bills b ON p.PatientID = b.PatientID
         join
     BillDetails bs ON b.BillID = bs.BillID AND bs.Description = 'Consultation Fee'
         join
     BillDetails ms ON b.BillID = ms.BillID AND ms.Description = 'Medicine Fee'
         join
     Appointments a ON p.PatientID = a.PatientID
         join
     Doctors d ON a.DoctorID = d.DoctorID
         join
     Rooms r ON a.AppointmentID = r.RoomID
         left join
     PrescriptionDetails pd ON a.AppointmentID = pd.PrescriptionID
where b.PaidStatus = 'Paid'
group by p.PatientID, b.BillID, a.AppointmentID
order by GrandTotal DESC;