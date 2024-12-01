-- 1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00
AND table_no IN (
SELECT table_no
FROM restRoom_management
WHERE headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles')
);

-- 2
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
SELECT headwaiter
FROM restRoom_management
WHERE room_date = 160111
AND room_name IN (
SELECT room_name
FROM restRest_table
WHERE table_no IN (
SELECT table_no
FROM restBill
WHERE cust_name = 'Nerida Smith'
)
)
);

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);

-- 5
SELECT cust_name, first_name, surname, room_name
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE bill_total = (SELECT MAX(bill_total) FROM restBill);