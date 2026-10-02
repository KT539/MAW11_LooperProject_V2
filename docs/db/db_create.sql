-- Core Schema
DROP DATABASE IF EXISTS MAW11_Looper_RGK;
CREATE DATABASE MAW11_Looper_RGK CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE MAW11_Looper_RGK;

-- FORMS table
CREATE TABLE forms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    status ENUM('building', 'answering', 'closed')
);

-- FIELDS table
CREATE TABLE fields (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    type VARCHAR(30) NOT NULL,
    form_id INT NOT NULL,
    CONSTRAINT fk_fields_form
        FOREIGN KEY (form_id) REFERENCES forms(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ANSWERS table (status column from AI)
CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    answer_content VARCHAR(250),
    answer_datetime DATETIME,
    status ENUM('empty', 'answered', 'answered_long')
        GENERATED ALWAYS AS (
            CASE
                WHEN answer_content IS NULL OR answer_content = '' THEN 'empty'
                WHEN CHAR_LENGTH(answer_content) > 100 THEN 'answered_long'
                ELSE 'answered'
                END
            ) STORED,
    field_id INT NOT NULL,
    CONSTRAINT fk_answers_fields
        FOREIGN KEY (field_id) REFERENCES fields(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
