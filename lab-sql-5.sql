alter table staff
drop column picture;
describe staff;

ALTER TABLE customer
MODIFY COLUMN store_id TINYINT UNSIGNED NOT NULL DEFAULT 1;

INSERT INTO customer (first_name, last_name, email, address_id, active, create_date, last_update)
VALUES ('TAMMY', 'SANDERS', 'tammy@email.com', 1, 1, NOW(), NOW());


SELECT customer_id FROM customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

SELECT inventory_id FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur')
LIMIT 1;

SELECT staff_id FROM staff
WHERE first_name = 'Mike' AND last_name = 'Hillyer';


INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, return_date, last_update)
VALUES (NOW(), 130, 1, 1, NULL, NOW());

SELECT customer_id, email, create_date
FROM customer
WHERE active = 0;

CREATE TABLE deleted_users (
    customer_id SMALLINT,
    email VARCHAR(50),
    deletion_date DATE
);

INSERT INTO deleted_users (customer_id, email, deletion_date)
SELECT customer_id, email, DATE(create_date)
FROM customer
WHERE active = 0;

ALTER TABLE payment
DROP FOREIGN KEY fk_payment_customer;

ALTER TABLE payment
ADD FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE CASCADE;

SET foreign_key_checks = 0;
DELETE FROM customer WHERE active = 0 AND customer_id > 0;
SET foreign_key_checks = 1;

SELECT * from deleted_users;