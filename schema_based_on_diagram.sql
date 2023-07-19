CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
Name VARCHAR(50)
Date_of_birth DATE,
PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
ADD CONSTRAINTS fk_patient_id
FOREIGN KEY(patient_id)
REFERENCES patients(id)
status VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(50),
name VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY,
total Amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
ADD CONSTRAINT fk_medical_histories
FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id)
PRIMARY KEY(id)
);
CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
PRIMARY KEY(id)
);
ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice,
FOREIGN KEY(invoice_id)
REFERENCES invoices(id);
ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatment
FOREIGN KEY(treatment_id)
REFERENCES treatments(id);
CREATE INDEX idx_treatment ON invoice_items(treatment_id);
CREATE INDEX idx_invoice ON invoice_items(invoice_id);
CREATE INDEX idx_medical_history ON invoices(medical_history_id);
CREATE INDEX idx_patient_id ON medical_histories(patient_id);