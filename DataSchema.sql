-- ================================
-- 📊 DataSchema.sql - Physical DB Schema
-- Laboratory Work #3
-- ================================

-- Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    emotional_state VARCHAR(50)
        CHECK (emotional_state ~ '^[A-Za-z\\s]+$')  -- only letters and spaces
);

-- Sensors table
CREATE TABLE Sensors (
    sensor_id SERIAL PRIMARY KEY,
    humidity_value REAL CHECK (humidity_value >= 0)
);

-- Humidity table
CREATE TABLE Humidity (
    humidity_id SERIAL PRIMARY KEY,
    level REAL CHECK (level BETWEEN 0 AND 100)
);

-- Environment parameters table
CREATE TABLE EnvironmentParameters (
    env_id SERIAL PRIMARY KEY,
    temperature REAL,
    lighting REAL,
    humidity REAL
);

-- Messages table
CREATE TABLE Messages (
    message_id SERIAL PRIMARY KEY,
    text VARCHAR(255)
        CHECK (text ~ '^[A-Za-z0-9\\s,!.?]+$'), -- allows letters, numbers, spaces, punctuation
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Motivational messages table
CREATE TABLE MotivationalMessages (
    motivation_id SERIAL PRIMARY KEY,
    intensity INTEGER CHECK (intensity BETWEEN 1 AND 10),
    message_id INTEGER,
    FOREIGN KEY (message_id) REFERENCES Messages(message_id)
);

-- Recommendations table
CREATE TABLE Recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    text VARCHAR(255),
    creation_date DATE,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Recommendations history table
CREATE TABLE RecommendationsHistory (
    history_id SERIAL PRIMARY KEY,
    recommendations_list TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Relaxation techniques table
CREATE TABLE RelaxationTechniques (
    relax_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
        CHECK (name ~ '^[A-Za-z\\s]+$'),
    description TEXT
);
