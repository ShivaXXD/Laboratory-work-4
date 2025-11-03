-- ================================
-- 📊 DataSchemaModified.sql - Physical DB Schema (Compliant)
-- Laboratory Work #3
-- ================================

-- USERS table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    emotional_state VARCHAR(50)
    CHECK (
        emotional_state ~ '^[A-Za-z\\s]+$'
    )  -- Only letters and spaces
);

--  SENSORS table
CREATE TABLE sensors (
    sensor_id SERIAL PRIMARY KEY,
    humidity_value REAL CHECK (humidity_value >= 0)
);

-- HUMIDITY table
CREATE TABLE humidity (
    humidity_id SERIAL PRIMARY KEY,
    humidity_level REAL CHECK (humidity_level BETWEEN 0 AND 100)
);

-- ENVIRONMENT_PARAMETERS table
CREATE TABLE environment_parameters (
    env_id SERIAL PRIMARY KEY,
    temperature REAL,
    lighting REAL,
    humidity REAL
);

-- MESSAGES table
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    message_text VARCHAR(255)
    CHECK (
        message_text ~ '^[A-Za-z0-9\\s,!.?]+$'
    ), -- Letters, numbers, spaces, punctuation
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- MOTIVATIONAL_MESSAGES table
CREATE TABLE motivational_messages (
    motivation_id SERIAL PRIMARY KEY,
    intensity INTEGER CHECK (intensity BETWEEN 1 AND 10),
    message_id INTEGER,
    FOREIGN KEY (message_id) REFERENCES messages (message_id)
);

-- RECOMMENDATIONS table
CREATE TABLE recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    recommendation_text VARCHAR(255),
    creation_date DATE,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- RECOMMENDATIONS_HISTORY table
CREATE TABLE recommendations_history (
    history_id SERIAL PRIMARY KEY,
    recommendations_list TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- RELAXATION_TECHNIQUES table
CREATE TABLE relaxation_techniques (
    relax_id SERIAL PRIMARY KEY,
    technique_name VARCHAR(100)
    CHECK (
        technique_name ~ '^[A-Za-z\\s]+$'
    ),
    description TEXT
);
