-- Project: Pokémon Database Management System
-- Name: Ehsaas Choudhary
-- Date: 18/10/2025

-- STEP 1: Create the database
CREATE DATABASE pokemon_db;

-- STEP 2: Use the database
USE pokemon_db;

-- STEP 3: Create main Pokémon table
CREATE TABLE pokemon (
    pokemon_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    first_appearance VARCHAR(100),
    primary_type VARCHAR(30) NOT NULL,
    secondary_type VARCHAR(30),
    generation TINYINT NOT NULL CHECK (generation BETWEEN 1 AND 9),
    category ENUM('Regular','Legendary','Mythical') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_pokemon (name, generation)
);

desc pokemon;

-- STEP 4: Create stats table (linked to pokemon)
CREATE TABLE pokemon_stats (
    stats_id INT AUTO_INCREMENT PRIMARY KEY,
    pokemon_id INT NOT NULL,
    hp SMALLINT NOT NULL CHECK (hp >= 0 AND hp <= 999),
    attack SMALLINT NOT NULL CHECK (attack >= 0 AND attack <= 999),
    defense SMALLINT NOT NULL CHECK (defense >= 0 AND defense <= 999),
    special_attack SMALLINT NOT NULL CHECK (special_attack >= 0 AND special_attack <= 999),
    special_defense SMALLINT NOT NULL CHECK (special_defense >= 0 AND special_defense <= 999),
    speed SMALLINT NOT NULL CHECK (speed >= 0 AND speed <= 999),
    total_base_stats INT GENERATED ALWAYS AS (hp + attack + defense + special_attack + special_defense + speed) STORED,
    weight_kg DECIMAL(6,2) CHECK (weight_kg >= 0),
    height_m DECIMAL(4,2) CHECK (height_m >= 0),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id) ON DELETE CASCADE
);

desc pokemon_stats;

-- STEP 5: Create abilities table (linked to pokemon)
CREATE TABLE pokemon_abilities (
    ability_id INT AUTO_INCREMENT PRIMARY KEY,
    pokemon_id INT NOT NULL,
    ability_name VARCHAR(120) NOT NULL,
    is_hidden BOOLEAN NOT NULL DEFAULT FALSE,
    extra_info JSON,
    UNIQUE KEY unique_ability (pokemon_id, ability_name),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id) ON DELETE CASCADE
);

-- STEP 6: Create a view combining Pokémon and stats
CREATE VIEW pokemon_summary_view AS
SELECT
    p.pokemon_id,
    p.name,
    p.generation,
    p.category,
    p.primary_type,
    p.secondary_type,
    ps.total_base_stats
FROM pokemon p
LEFT JOIN pokemon_stats ps ON p.pokemon_id = ps.pokemon_id;
