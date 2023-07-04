DROP SCHEMA IF EXISTS INSTANT_RESUME;
CREATE SCHEMA INSTANT_RESUME;
USE INSTANT_RESUME;

CREATE TABLE user_data (
    USER_ID VARCHAR(45) NOT NULL,
    USER_NAME VARCHAR(45) NOT NULL,
    USER_PW VARCHAR(45) NOT NULL,
    EMAIL_YN VARCHAR(45) NOT NULL DEFAULT 'N',
    PROFILE_PIC VARCHAR(45) NOT NULL DEFAULT 'person-circle.svg',
    JOIN_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (USER_ID)
);
