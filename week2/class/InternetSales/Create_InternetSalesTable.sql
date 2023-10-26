-- Drop the table if it exists
DROP TABLE IF EXISTS FactInternetSales;

-- Create a new table
CREATE TABLE FactInternetSales(
    "ProductKey" INT NOT NULL,
    "OrderDateKey" INT NOT NULL,
    "DueDateKey" INT NOT NULL,
    "ShipDateKey" INT NOT NULL,
    "CustomerKey" INT NOT NULL,
    "PromotionKey" INT NOT NULL,
    "CurrencyKey" INT NOT NULL,
    "SalesTerritoryKey" INT NOT NULL,
    "SalesOrderNumber" VARCHAR(20) NOT NULL,
    "SalesOrderLineNumber" SMALLINT NOT NULL, -- tinyint in SQL Server is equivalent to smallint in PostgreSQL
    "RevisionNumber" SMALLINT NOT NULL,
    "OrderQuantity" SMALLINT NOT NULL,
    "UnitPrice" DECIMAL(19,4) NOT NULL, -- money in SQL Server is equivalent to DECIMAL(19,4) in PostgreSQL
    "ExtendedAmount" DECIMAL(19,4) NOT NULL,
    "UnitPriceDiscountPct" DOUBLE PRECISION NOT NULL, -- float in SQL Server is equivalent to DOUBLE PRECISION in PostgreSQL
    "DiscountAmount" DOUBLE PRECISION NOT NULL,
    "ProductStandardCost" DECIMAL(19,4) NOT NULL,
    "TotalProductCost" DECIMAL(19,4) NOT NULL,
    "SalesAmount" DECIMAL(19,4) NOT NULL,
    "TaxAmt" DECIMAL(19,4) NOT NULL,
    "Freight" DECIMAL(19,4) NOT NULL,
    "CarrierTrackingNumber" VARCHAR(25),
    "CustomerPONumber" VARCHAR(25),
    "OrderDate" TIMESTAMP,
    "DueDate" TIMESTAMP,
    "ShipDate" TIMESTAMP
);
