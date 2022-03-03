USE test_db;
CREATE TABLE shop (
    phone INT UNSIGNED  DEFAULT '0000' NOT NULL,
    manufacturer  CHAR(20)      DEFAULT ''     NOT NULL,
    price   DECIMAL(16,2) DEFAULT '0.00' NOT NULL,
    PRIMARY KEY(article, dealer));
INSERT INTO shop VALUES
    (1,'Apple',1500.45),(1,'SAUMSUNG',1100.99),(2,'SONY',900.99),(3,'GOOGLE',980.45),
    (3,'HAWEI',600.69),(3,'XAOMI',500.25),(4,'APPLE',1999.95);
SELECT * FROM shop;