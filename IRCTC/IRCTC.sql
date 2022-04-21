
DROP SCHEMA IF EXISTS irctc;
CREATE SCHEMA IF NOT EXISTS irctc;
USE irctc;

CREATE TABLE IF NOT EXISTS irctc.trains(
	train_no INT UNSIGNED UNIQUE NOT NULL,
    starting_station VARCHAR(45),
    ending_station VARCHAR(45),
    train_type VARCHAR(20) NOT NULL,
    PRIMARY KEY(train_no)
    );
    
    
CREATE TABLE IF NOT EXISTS irctc.customer(
	id INT UNSIGNED UNIQUE NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    train_no INT UNSIGNED,
    PRIMARY KEY(id),
    CONSTRAINT fk_customer_train_no
    FOREIGN KEY(train_no) REFERENCES trains(train_no)
    );
    
CREATE TABLE IF NOT EXISTS irctc.ticket(
	ticket_no INT UNSIGNED UNIQUE NOT NULL,
    is_reserved BOOLEAN,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    train_no INT UNSIGNED,
    customer_id INT UNSIGNED,
    PRIMARY KEY(ticket_no),
    CONSTRAINT fk_ticket_train_no
    FOREIGN KEY(train_no) REFERENCES trains(train_no),
    CONSTRAINT fk_ticket_customer_id
    FOREIGN KEY(customer_id) REFERENCES customer(id));