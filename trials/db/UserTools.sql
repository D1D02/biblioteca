CREATE TABLE Quotes(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    start_page TINYINT UNSIGNED,
    end_page TINYINT UNSIGNED,
    addition_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),    

);

CREATE TABLE Loans(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP NOT NULL DEFAULT ( CURRENT_TIMESTAMP + INTERVAL 30 DAY ),
    notes VARCHAR(500),

    PRIMARY KEY(id), 

);

CREATE TABLE User_Books(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    status  ENUM( 'reading', 'tbr', 'read', 'abandoned' ),
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP,
    review_text VARCHAR(500),
    review_number TINYINT,

    PRIMARY KEY(id), 

);

/*Quotes*/
ALTER TABLE Quotes 
ADD CONSTRAINT FK_books_3 FOREIGN KEY (book_id) REFERENCES Books(id);
ALTER TABLE Quotes 
ADD CONSTRAINT FK_user_1 FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE Quotes
ADD CONSTRAINT CHK_StartPageLessThanEndPage CHECK CHECK CHECK ( end_page >= start_page );

/*Loans*/
ALTER TABLE Loans 
ADD CONSTRAINT FK_books_4 FOREIGN KEY (book_id) REFERENCES Books(id);
ALTER TABLE Loans 
ADD CONSTRAINT FK_user_2 FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE Loans
ADD CONSTRAINT CHK_StartDateLessThanEndDate_1 CHECK CHECK CHECK ( end_date >= start_date );

/*Book_Read_User*/
ALTER TABLE Book_Read_User 
ADD CONSTRAINT FK_books_4 FOREIGN KEY (book_id) REFERENCES Books(id);
ALTER TABLE Book_Read_User 
ADD CONSTRAINT FK_user_3 FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE Book_Read_User
ADD CONSTRAINT CHK_StartDateLessThanEndDate_2 CHECK CHECK CHECK ( end_date >= start_date );
ALTER TABLE Book_Read_User
CONSTRAINT CHK_ReviewRange CHECK (review_number >= 0 AND review_number <= 5),
ALTER TABLE Book_Read_User
CONSTRAINT CHK_ReviewRequiresEndDate CHECK ( ( review_text IS NULL AND review_number IS NULL ) OR ( end_date IS NOT NULL ) )
