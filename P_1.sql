
-- ============================
-- Sample Data
-- ============================

INSERT INTO theatre (name, city, address) 
VALUES 
('Samdareeya Era Cinema', 'Jabalpur', '3rd Floor, Samdareeya Mall, Civic Centre, Jabalpur'),
('PVR: KA Mall', 'Jabalpur', '4th floor, KA Mall, Jyoti talkies, Jabalpur'),
('Movie Magic (SAM)', 'Jabalpur', '2nd Floor, South Avenue Mall, Narmada Road, Jabalpur');

INSERT INTO screen (theatre_id, screen_name, total_seats)
VALUES 
(1, 'Screen 1', 150),
(1, 'Screen 2', 120),
(2, 'Screen 1', 100),
(2, 'Screen 2', 80),
(3, 'Screen 1', 130),
(3, 'Screen 2', 110);

INSERT INTO movie (title, language, duration_minutes, certificate, release_date)
VALUES
("O'Romeo",'Hindi', 179, 'A', '2026-02-13'),
('The Kerala Story 2: Goes Beyond', 'Hindi', 131, 'UA', '2026-02-27'),
('Assi', 'Hindi', 133, 'A', '2026-02-20'),
('Mardaani 3', 'Hindi', 130, 'UA16+', '2026-01-30'),
('Goat', 'English', 159, 'U', '2026-02-20');

INSERT INTO show_details (theatre_id, movie_id, screen_id, show_date, show_time, price)
VALUES
(1, 1, 1, '2026-02-25', '12:15:00', 180.00),
(1, 2, 1, '2026-02-25', '16:00:00', 200.00),
(2, 2, 1, '2026-02-25', '16:00:00', 200.00),
(2, 2, 2, '2026-02-25', '19:20:00', 220.00),
(3, 3, 1, '2026-02-25', '22:15:00', 190.00),
(3, 4, 2, '2026-02-25', '10:00:00', 80),
(2, 5, 1, '2026-02-25', '10:00:00', 80),
(2, 5, 2, '2026-02-25', '11:00:00', 80);
