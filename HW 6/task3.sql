-- 1
SELECT DISTINCT ws.first_name, ws.surname
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff hw ON rm.headwaiter = hw.staff_no
WHERE hw.first_name = 'Charles' AND rm.room_name = 'Green'
AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT ws.first_name, ws.surname
FROM restStaff ws
JOIN restStaff hw ON ws.headwaiter = hw.staff_no
WHERE hw.staff_no = (SELECT headwaiter
FROM restStaff
WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4
SELECT b.cust_name, b.bill_total, ws.first_name, ws.surname
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT ws.first_name, ws.surname
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
WHERE ws.headwaiter IN (
SELECT headwaiter
FROM restBill
WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT ws.first_name, ws.surname
FROM restStaff ws
JOIN restRoom_management rm ON rm.headwaiter = ws.staff_no
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;