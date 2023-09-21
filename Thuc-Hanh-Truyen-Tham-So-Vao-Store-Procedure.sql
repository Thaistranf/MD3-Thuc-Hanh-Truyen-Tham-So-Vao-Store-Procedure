use classicmodels;
-- Tao SP co tham so dau vao IN
DELIMITER //
CREATE PROCEDURE getCusById(IN cusNum INT)
BEGIN
  SELECT * FROM customers WHERE customerNumber = cusNum;
END; 
//
DELIMITER ;
-- Goi den SP
call getCusById(175);

-- Tao SP co tham so dau ra OUT
DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity (IN in_city VARCHAR(50), OUT total INT)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END;
//
DELIMITER ;
-- Goi SP
call GetCustomersCountByCity ('Lyon',@total);
-- Hien thi
select @total;

-- Tao SP co tham so INOUT (in-out)
DELIMITER //
CREATE PROCEDURE SetCounter(INOUT counter INT, IN inc INT)
BEGIN
	SET counter = counter + inc;
END;
//
DELIMITER ;
-- Tao tham so de luu gia tri
SET @counter = 1;
-- Goi SP
CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8
-- Hien thi
SELECT @counter; -- 8