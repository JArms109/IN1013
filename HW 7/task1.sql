--1
CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM bills
WHERE waiter_id = (SELECT id FROM waiters WHERE first_name = 'Sam' AND surname = 'Pitt');

--2
SELECT *
FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS
SELECT room_name, SUM(bill_total) AS total_sum
FROM room_bills
GROUP BY room_name;

--4
CREATE VIEW teamTotals AS
SELECT CONCAT(w.first_name, ' ', w.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM bills b
JOIN waiters w ON b.waiter_id = w.id
GROUP BY w.first_name, w.surname;