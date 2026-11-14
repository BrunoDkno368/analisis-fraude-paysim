USE fraude_paysim;

DROP TABLE IF EXISTS tabla_paysim;

CREATE TABLE tabla_paysim (
    id INT AUTO_INCREMENT PRIMARY KEY,
    step INT,
    type VARCHAR(20),
    amount DOUBLE,
    oldbalanceOrg DOUBLE,
    newbalanceOrig DOUBLE,
    isFraud TINYINT,
    en_regla TINYINT,
    periodo TINYINT
);

