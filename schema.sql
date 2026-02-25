
-- ============================
-- BookMyShow Database Schema
-- ============================

CREATE TABLE theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE screen (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
        ON DELETE CASCADE
);

CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    language VARCHAR(50),
    duration_minutes INT,
    certificate VARCHAR(10),
    release_date DATE
);

CREATE TABLE show_details (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
	theatre_id INT NOT NULL,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    price DECIMAL(8,2) NOT NULL,
	FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
        ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
        ON DELETE CASCADE,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id)
        ON DELETE CASCADE,
    UNIQUE(theatre_id, movie_id, screen_id, show_date, show_time)
);
