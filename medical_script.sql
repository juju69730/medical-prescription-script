
CREATE TABLE IF NOT EXISTS medical_prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    details TEXT NOT NULL,
    expiration_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS medical_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    record TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
