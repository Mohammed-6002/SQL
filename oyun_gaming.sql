-- Create database (if not exists)
CREATE DATABASE IF NOT EXISTS oyun_gaming;
USE oyun_gaming;

-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Games Table
CREATE TABLE IF NOT EXISTS games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    publisher VARCHAR(100),
    release_date DATE,
    platforms VARCHAR(255),
    price DECIMAL(10, 2),
    image_url VARCHAR(255),
    esrb_rating VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Screenshots Table
CREATE TABLE IF NOT EXISTS screenshots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    image_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

-- Create Reviews Table
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    user_id INT,
    title VARCHAR(100),
    content TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Sample Data for Games
INSERT INTO games (title, description, category, publisher, release_date, platforms, price, image_url, esrb_rating) VALUES 
('Grand Theft Auto VI', 'The next installment in the world-renowned Grand Theft Auto series.', 'Action', 'Rockstar Games', '2025-10-15', 'PS5, Xbox Series X, PC', 69.99, 'images/game1.jpg', 'M'),
('The Elder Scrolls VI', 'The long-awaited sequel to Skyrim, set in a vast open world of fantasy and adventure.', 'RPG', 'Bethesda', '2024-11-20', 'PS5, Xbox Series X, PC', 59.99, 'images/game2.jpg', 'M'),
('Starfield', 'A new space-faring RPG from the creators of Skyrim and Fallout.', 'RPG', 'Bethesda', '2023-09-06', 'Xbox Series X, PC', 69.99, 'images/game3.jpg', 'M'),
('Assassin''s Creed: Shadows', 'Travel to feudal Japan in this new entry in the Assassin''s Creed series.', 'Action', 'Ubisoft', '2023-12-01', 'PS5, Xbox Series X, PC', 59.99, 'images/game4.jpg', 'M'),
('FIFA 24', 'The latest installment in the FIFA series with updated teams and features.', 'Sports', 'EA Sports', '2023-09-29', 'PS5, PS4, Xbox Series X, Xbox One, PC, Switch', 69.99, 'images/game5.jpg', 'E'),
('Hogwarts Legacy', 'An immersive, open-world action RPG set in the world of Harry Potter.', 'RPG', 'Warner Bros. Games', '2023-02-10', 'PS5, PS4, Xbox Series X, Xbox One, PC', 59.99, 'images/game6.jpg', 'T'),
('The Legend of Zelda: Echoes of Wisdom', 'Play as Princess Zelda in this new adventure in the beloved series.', 'Adventure', 'Nintendo', '2024-02-24', 'Switch', 59.99, 'images/game7.jpg', 'E10+'),
('Call of Duty: Modern Warfare III', 'The sequel to 2022''s Modern Warfare II, featuring a new campaign and multiplayer modes.', 'FPS', 'Activision', '2023-11-10', 'PS5, PS4, Xbox Series X, Xbox One, PC', 69.99, 'images/game8.jpg', 'M'),
('Cyberpunk 2077: Phantom Liberty', 'A massive expansion for Cyberpunk 2077, adding a new district and storyline.', 'RPG', 'CD Projekt RED', '2023-09-26', 'PS5, Xbox Series X, PC', 29.99, 'images/game9.jpg', 'M'),
('Marvel''s Spider-Man 2', 'The sequel to the acclaimed Marvel''s Spider-Man, featuring both Peter Parker and Miles Morales.', 'Action', 'Sony Interactive Entertainment', '2023-10-20', 'PS5', 69.99, 'images/game10.jpg', 'T');

-- Sample Data for Screenshots (3 screenshots per game)
INSERT INTO screenshots (game_id, image_url) VALUES 
(1, 'images/screenshots/game1_1.jpg'),
(1, 'images/screenshots/game1_2.jpg'),
(1, 'images/screenshots/game1_3.jpg'),
(2, 'images/screenshots/game2_1.jpg'),
(2, 'images/screenshots/game2_2.jpg'),
(2, 'images/screenshots/game2_3.jpg'),
(3, 'images/screenshots/game3_1.jpg'),
(3, 'images/screenshots/game3_2.jpg'),
(3, 'images/screenshots/game3_3.jpg'),
(4, 'images/screenshots/game4_1.jpg'),
(4, 'images/screenshots/game4_2.jpg'),
(4, 'images/screenshots/game4_3.jpg'),
(5, 'images/screenshots/game5_1.jpg'),
(5, 'images/screenshots/game5_2.jpg'),
(5, 'images/screenshots/game5_3.jpg'),
(6, 'images/screenshots/game6_1.jpg'),
(6, 'images/screenshots/game6_2.jpg'),
(6, 'images/screenshots/game6_3.jpg'),
(7, 'images/screenshots/game7_1.jpg'),
(7, 'images/screenshots/game7_2.jpg'),
(7, 'images/screenshots/game7_3.jpg'),
(8, 'images/screenshots/game8_1.jpg'),
(8, 'images/screenshots/game8_2.jpg'),
(8, 'images/screenshots/game8_3.jpg'),
(9, 'images/screenshots/game9_1.jpg'),
(9, 'images/screenshots/game9_2.jpg'),
(9, 'images/screenshots/game9_3.jpg'),
(10, 'images/screenshots/game10_1.jpg'),
(10, 'images/screenshots/game10_2.jpg'),
(10, 'images/screenshots/game10_3.jpg');

-- Sample User (password: password123)
INSERT INTO users (username, password, email, full_name) VALUES
('admin', '$2y$10$6SYvh7YyHUfK4q5UCYkOZOTCvmAR1e.bIiPNbUwjw09r0jOQLAVlm', 'admin@example.com', 'Admin User'),
('johndoe', '$2y$10$6SYvh7YyHUfK4q5UCYkOZOTCvmAR1e.bIiPNbUwjw09r0jOQLAVlm', 'john@example.com', 'John Doe'),
('janedoe', '$2y$10$6SYvh7YyHUfK4q5UCYkOZOTCvmAR1e.bIiPNbUwjw09r0jOQLAVlm', 'jane@example.com', 'Jane Doe');

-- Sample Reviews
INSERT INTO reviews (game_id, user_id, title, content, rating) VALUES
(1, 1, 'Amazing Game!', 'This is the best Grand Theft Auto yet. The graphics are incredible and the storyline is engaging.', 5),
(1, 2, 'Great but buggy', 'While the game is fantastic, there are still some bugs that need to be fixed.', 4),
(2, 1, 'Skyrim successor', 'The Elder Scrolls VI lives up to the hype and delivers an amazing RPG experience.', 5),
(3, 3, 'Space adventure', 'Starfield offers a vast universe to explore with compelling quests and characters.', 4),
(4, 2, 'Finally in Japan!', 'The Japan setting is perfect for Assassin''s Creed. Combat and stealth mechanics are refined.', 4),
(6, 1, 'Magical experience', 'Hogwarts Legacy brings the wizarding world to life in a way no other game has done before.', 5),
(8, 3, 'Solid shooter', 'Call of Duty continues to deliver fast-paced action and polished gunplay.', 4),
(10, 2, 'Web-slinging fun', 'Spider-Man 2 improves on everything that made the first game great.', 5);