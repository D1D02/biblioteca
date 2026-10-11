CREATE TABLE Users(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100),
    email VARCHAR(320),
    bio text,
    password_hash VARCHAR(255) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visibility TINYINT(1) DEFAULT 1,
    blocked TINYINT(1) DEFAULT 1,

    PRIMARY KEY(id),

);

CREATE TABLE Admins(
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100),
    password_hash VARCHAR(255) NOT NULL,
    type ENUM( 'admin', 'librarian' ),

    PRIMARY KEY(id),
    
);

CREATE TABLE User_Login(
    user_id BIGINT UNSIGNED NOT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Admin_Login(
    admin_id BIGINT UNSIGNED NOT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*User Login*/
ALTER TABLE Users 
ADD CONSTRAINT FK_users_1 FOREIGN KEY (user_id) REFERENCES Users(id);

/*Admin Login*/
ALTER TABLE Users 
ADD CONSTRAINT FK_admins_1 FOREIGN KEY (admin_id) REFERENCES Admins(id);
