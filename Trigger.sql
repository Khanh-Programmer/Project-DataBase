use hospital_management_system;
# Trigger cho AFTER DELETE :
DELIMITER $$
CREATE TRIGGER UpdateTotalAmountAfterDelete
AFTER DELETE ON BillDetails
FOR EACH ROW
BEGIN
    UPDATE Bills
    SET TotalAmount = (
        SELECT SUM(Amount)
        FROM BillDetails
        WHERE BillID = OLD.BillID
    )
    WHERE BillID = OLD.BillID;
END $$

DELIMITER ;

# Trigger cho afterupdate :
DELIMITER $$

CREATE TRIGGER UpdateTotalAmountAfterUpdate
AFTER UPDATE ON BillDetails
FOR EACH ROW
BEGIN
    UPDATE Bills
    SET TotalAmount = (
        SELECT SUM(Amount)
        FROM BillDetails
        WHERE BillID = NEW.BillID
    )
    WHERE BillID = NEW.BillID;
END $$

DELIMITER ;

-- Trigger này tự động cập nhật tổng số tiền hóa đơn khi thêm chi tiết hóa đơn mới.
DELIMITER $$
CREATE TRIGGER UpdateBillTotalAfterInsert
AFTER INSERT ON BillDetails
FOR EACH ROW
BEGIN
    UPDATE Bills
    SET TotalAmount = (
        SELECT SUM(Amount)
        FROM BillDetails
        WHERE BillID = NEW.BillID
    )
    WHERE BillID = NEW.BillID;
END $$
DELIMITER ;

