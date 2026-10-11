CREATE TABLE Books(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    image BLOB,
    author MEDIUMINT NOT NULL,
    publisher MEDIUMINT NOT NULL,
    genre MEDIUMINT NOT NULL,
    book_serie MEDIUMINT,
    volume UNSIGNED TINYINT,  
    publishing_date DATE,
    addition_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    number_page SMALLINT UNSIGNED NOT NULL,
    is_physical TINYINT(1) NOT NULL DEFAULT 1,
    ISBN VARCHAR(14) DEFAULT NULL,

    PRIMARY KEY(id),
    
);

CREATE TABLE Book_Articles(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT DEFAULT NULL,
    image BLOB,
    addition_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
    
);

CREATE TABLE Authors(
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    story TEXT DEFAULT NULL,
    born_date DATE,
    death_date DATE,

    PRIMARY KEY(id),
    
);

CREATE TABLE Genres(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,

    PRIMARY KEY(id),
    
);

CREATE TABLE Publishers(
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    description TEXT DEFAULT NULL,

    PRIMARY KEY(id),

);

CREATE TABLE Book_Series(
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    description TEXT DEFAULT NULL,

    PRIMARY KEY(id),

);

CREATE TABLE Bookshelves(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL,

    PRIMARY KEY(id),

);

CREATE TABLE Shelves(
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    bookshelf_id MEDIUMINT UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL,
    position TINYINT

    PRIMARY KEY(id),

);

CREATE TABLE Shelves_Books_Bridge(
    shelf_id BIGINT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,

    PRIMARY KEY( shelf_id, book_id )

);


/*Books*/
ALTER TABLE Books
ADD CONSTRAINT CHK_AdditionDateMorePublishingDate CHECK CHECK ( addition_date >= publishing_date );
ALTER TABLE Books 
ADD CONSTRAINT FK_publisher_1 FOREIGN KEY (publisher) REFERENCES Publishers(id);
ALTER TABLE Books 
ADD CONSTRAINT FK_authors_1 FOREIGN KEY (author) REFERENCES Authors(id);
ALTER TABLE Books 
ADD CONSTRAINT FK_genre_1 FOREIGN KEY (genre) REFERENCES Genres(id);

/*Book Articles*/
ALTER TABLE Book_Articles 
ADD CONSTRAINT FK_books_5 FOREIGN KEY (book_id) REFERENCES Books(id);

/*Authors*/
ALTER TABLE Authors
ADD CONSTRAINT CHK_DeathDateMoreBornDate CHECK CHECK CHECK ( death_date >= born_date );

/*Shelves*/
ALTER TABLE Shelves 
ADD CONSTRAINT FK_bookshelf_1 FOREIGN KEY (bookshelf_id) REFERENCES Bookshelves(id);

/*Shelves_Books_Bridge*/
ALTER TABLE Shelves_Books_Bridge 
ADD CONSTRAINT FK_books_6 FOREIGN KEY (book_id) REFERENCES Books(id);
ALTER TABLE Shelves_Books_Bridge 
ADD CONSTRAINT FK_shelves_1 FOREIGN KEY (shelf_id) REFERENCES Shelves(id);
