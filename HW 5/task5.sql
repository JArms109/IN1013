-- 1
SELECT first_name, surname, bill_date, COUNT(bill_no) AS num_bills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY waiter_no, bill_date
HAVING COUNT(bill_no) >= 2;

-- 2
SELECT room_name, COUNT(table_no) AS table_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT rm.room_name, SUM(rb.bill_total) AS total_bills
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
GROUP BY rm.room_name;

-- 4
SELECT hs.first_name, hs.surname, SUM(rb.bill_total) AS total_bill
FROM restStaff hs
JOIN restStaff ws ON hs.staff_no = ws.headwaiter
JOIN restBill rb ON ws.staff_no = rb.waiter_no
GROUP BY hs.staff_no
ORDER BY total_bill DESC;

-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6
SELECT first_name, surname, bill_date, COUNT(bill_no) AS num_bills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY waiter_no, bill_date
HAVING COUNT(bill_no) >= 3;