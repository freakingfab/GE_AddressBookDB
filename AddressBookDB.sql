-- UC1
CREATE DATABASE AddressBookDB;
USE AddressBookDB;


-- UC2
CREATE TABLE AddressBook (
    first_name TEXT,
    last_name TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    email TEXT,
    zip_code INTEGER,
    phone_no LONG
);

-- UC3
INSERT INTO addressbook (first_name, last_name, address, city, state, email, zip_code, phone_no)
VALUES
('Daksh', 'Nahar', '123 Main', 'Udaipur', 'RJ', 'daksh@example.com', 12345, '123-456-7890'),
('Yash', 'Jain', '456 Oak St', 'Udaipur', 'RJ', 'yash@example.com', 54321, '987-654-3210'),
('Dev', 'Joshi', '416 Oak St', 'Pune', 'MH', 'dev@example.com', 54521, '987-654-3510');

-- UC4
UPDATE addressbook
SET zip_code = 313001
WHERE first_name = 'Daksh' AND last_name = 'Nahar'

-- UC5
DELETE from addressbook
WHERE first_name = 'Yash' AND last_name = 'Jain'

-- UC6
SELECT * from addressbook
where state = 'RJ'

-- UC7
SELECT city, state, COUNT(*) AS contact_count
FROM addressbook
GROUP BY city, state;

-- UC8
SELECT first_name, last_name, city
FROM addressbook
WHERE city = 'Udaipur'
ORDER BY first_name, last_name;

-- UC9
ALTER TABLE addressbook
ADD book_type TEXT,
ADD book_name TEXT;

delete from addressbook

INSERT INTO addressbook (first_name, last_name, address, city, state, email, zip_code, phone_no,book_type,book_name)
VALUES
('Daksh', 'Nahar', '123 Main', 'Udaipur', 'RJ', 'daksh@example.com', 12345, '123-456-7890', 'Friend' , 'Book1'),
('Yash', 'Jain', '456 Oak St', 'Udaipur', 'RJ', 'yash@example.com', 54321, '987-654-3210','Friend' , 'Book1'),
('Dev', 'Joshi', '416 Oak St', 'Pune', 'MH', 'dev@example.com', 54521, '987-654-3510','Friend' , 'Book2'),
('Amit', 'Nahar', '416 Oak St', 'Pune', 'MH', 'amit@example.com', 54521, '987-654-3510','Family' , 'Book2'),
('Varun', 'Nahar', '416 Oak St', 'Udaipur', 'RJ', 'varun@example.com', 54521, '987-654-3510','Family' , 'Book1');

SELECT book_name, book_type
FROM addressbook;

-- UC10
SELECT book_type, COUNT(*) AS contact_count
FROM addressbook
GROUP BY book_type;

-- UC11
INSERT INTO addressbook (first_name, last_name, address, city, state, email, zip_code, phone_no, book_type, book_name)
VALUES ('Sahil', 'Tiwari', '123, Nagar', 'Pune', 'MH','sahile@examle.com', 12356, '456-564','Friend', 'Book1');

INSERT INTO addressbook (first_name, last_name, address, city, state, email, zip_code, phone_no, book_type, book_name)
VALUES ('Sahil', 'Tiwari', '123, Nagar', 'Pune', 'MH','sahile@examle.com', 12356, '456-564','Family', 'Book1');

-- UC12
DROP TABLE addressbook;
CREATE TABLE contact(
	first_name TEXT,
    last_name TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    email TEXT,
    zip_code INTEGER,
    phone_no LONG,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES addressbook(book_id)
);

CREATE TABLE addressbook(
	book_id INT PRIMARY KEY,
    book_type TEXT,
    book_name TEXT
);

INSERT INTO addressbook
VALUES 
(1, 'Friend' , 'Friend'),
(2,'Family','Family'),
(3, 'Professional', 'Professional');

INSERT INTO contact
VALUES
('Daksh', 'Nahar', '123 Main', 'Udaipur', 'RJ', 'daksh@example.com', 12345, 1234567890,(SELECT book_id FROM addressbook WHERE book_type = 'Friend')),
('Yash', 'Jain', '456 Oak St', 'Udaipur', 'RJ', 'yash@example.com', 54321, 9876543210,(SELECT book_id FROM addressbook WHERE book_type = 'Friend')),
('Dev', 'Joshi', '416 Oak St', 'Pune', 'MH', 'dev@example.com', 54521, 9876543510,(SELECT book_id FROM addressbook WHERE book_type = 'Friend')),
('Amit', 'Nahar', '416 Oak St', 'Pune', 'MH', 'amit@example.com', 54521, 9876543510,(SELECT book_id FROM addressbook WHERE book_type = 'Family')),
('Varun', 'Nahar', '416 Oak St', 'Udaipur', 'RJ', 'varun@example.com', 54521, 9876543510,(SELECT book_id FROM addressbook WHERE book_type = 'Family'));

-- UC13
SELECT * 
from contact c
JOIN addressbook ab ON ab.book_id = c.book_id
where state = 'RJ';

SELECT book_name, city, state, COUNT(*) AS contact_count
FROM addressBook ab
JOIN contact c ON ab.book_id = c.book_id
GROUP BY book_name, city, state;

SELECT first_name, last_name, city
FROM contact
WHERE city = 'Udaipur'
ORDER BY first_name, last_name;

SELECT book_type, COUNT(*) AS contact_count
FROM addressBook ab
JOIN contact c ON ab.book_id = c.book_id
GROUP BY book_type;
