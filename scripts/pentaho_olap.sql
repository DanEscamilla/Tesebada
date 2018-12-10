
CREATE DATABASE IF NOT EXISTS pentaho_olap;
use pentaho_olap;

DROP TABLE IF EXISTS `dim_customers`;
CREATE TABLE `dim_customers`
(
  customerid BIGINT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, customernumber INT
, customername VARCHAR(50)
, contactlastname VARCHAR(50)
, contactfirstname VARCHAR(50)
, phone VARCHAR(50)
, addressline1 VARCHAR(50)
, addressline2 VARCHAR(50)
, city VARCHAR(50)
, state VARCHAR(50)
, postalcode VARCHAR(15)
, country VARCHAR(50)
, salesrepemployeenumber INT
, creditlimit DOUBLE
)
;CREATE INDEX idx_dim_customers_lookup ON dim_customers(customernumber)
;
CREATE INDEX idx_dim_customers_tk ON dim_customers(customerid)
;

DROP TABLE IF EXISTS `dim_time`;
CREATE TABLE `dim_time`
(
  date_short TINYTEXT
, date_medium TINYTEXT
, day_abbreviation TINYTEXT
, month_abbreviation TINYTEXT
, month_name TINYTEXT
, quarter_name TINYTEXT
, year_quarter TINYTEXT
, year_month_abbreviation TINYTEXT
, year4 TINYTEXT
, week_in_year TINYTEXT
, week_in_month TINYTEXT
, month_number TINYTEXT
, quarter_number TINYTEXT
, year_month_number TINYTEXT
, date_key TINYTEXT
, date_long TINYTEXT
, date_full TINYTEXT
, day_name TINYTEXT
, year2 TINYTEXT
, day_in_year TINYTEXT
, is_last_day_in_month TINYTEXT
, is_first_day_in_month TINYTEXT
, is_last_day_in_week TINYTEXT
, is_first_day_in_week TINYTEXT
, day_in_month TINYTEXT
, date_value DATETIME
)
;



DROP TABLE IF EXISTS `dim_product`;
CREATE TABLE `dim_product`
(
  productid BIGINT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, productcode VARCHAR(15)
, productname VARCHAR(70)
, productline VARCHAR(50)
, productscale VARCHAR(10)
, productvendor VARCHAR(50)
, productdescription TEXT
, productquantityinstock INT
, productbuyprice DOUBLE
, productmsrp DOUBLE
)
;CREATE INDEX idx_dim_product_lookup ON dim_product(productcode)
;
CREATE INDEX idx_dim_product_tk ON dim_product(productid)
;

DROP TABLE IF EXISTS `dim_salesrep`;
CREATE TABLE `dim_salesrep`
(
  salesrepid BIGINT NOT NULL PRIMARY KEY
, version INT
, date_from DATETIME
, date_to DATETIME
, salesrepnumber INT
, extension VARCHAR(10)
, email VARCHAR(100)
, officecode VARCHAR(10)
, reportsto INT
, jobtitle VARCHAR(50)
, salesrepname VARCHAR(101)
)
;CREATE INDEX idx_dim_salesrep_lookup ON dim_salesrep(salesrepnumber)
;
CREATE INDEX idx_dim_salesrep_tk ON dim_salesrep(salesrepid)
;

DROP TABLE IF EXISTS `fact_orders`;
CREATE TABLE `fact_orders`
(
  ordernumber INT
, status VARCHAR(15)
, productid INT
, customerid INT
, customersalesrepid INT
, qunatityordered DECIMAL(32)
, priceeach DOUBLE
, productbuyprice DOUBLE
, ordertimeid BIGINT
)
;
