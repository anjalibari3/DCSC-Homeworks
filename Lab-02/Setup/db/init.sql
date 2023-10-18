-- Fact Table

CREATE TABLE outcomes (

    fact_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    animal_id VARCHAR, 
    date_id INT,
    MonthYear VARCHAR,
    outcome_type VARCHAR,
    outcome_subtype VARCHAR,
    animal_type VARCHAR, 
    age_id VARCHAR,
    breed_id VARCHAR,
    color_id VARCHAR,
    sex_id VARCHAR
);

-- Dimension Tables

CREATE TABLE AnimalDim (

    animal_id VARCHAR PRIMARY KEY,
    name VARCHAR(255),
    color INT,
    breed INT,
    dateOfBirth DATE
);

CREATE TABLE DateDim (
    
    date_id SERIAL PRIMARY KEY,
    date DATE,
    MonthYear VARCHAR(7),
    month INT,
    year INT
);

CREATE TABLE BreedDim (
    
    breed_id VARCHAR PRIMARY KEY,
    breed VARCHAR(255) NOT NULL,
    color VARCHAR(255)
);

