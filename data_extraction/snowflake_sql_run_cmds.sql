-- CREATE DATABASE zack_DataExpert;
DROP TABLE stock_tickers

CREATE TABLE stock_tickers (
    ticker VARCHAR,
        name VARCHAR,
        market VARCHAR,
        locale VARCHAR,
        primary_exchange VARCHAR,
        type VARCHAR,
        active BOOLEAN,
        currency_name VARCHAR,
        cik VARCHAR,
        composite_figi VARCHAR,
        share_class_figi VARCHAR,
        last_updated_utc TIMESTAMP,
        ds VARCHAR
)

SELECT * FROM stock_tickers

SELECT COUNT(1) FROM stock_tickers

SELECT ds,COUNT(1) FROM stock_tickers
GROUP BY ds

DELETE FROM stock_tickers

ALTER TABLE stock_tickers ADD COLUMN ds DATE;