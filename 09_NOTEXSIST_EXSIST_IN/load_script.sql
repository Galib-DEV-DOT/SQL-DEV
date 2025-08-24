-- Import Customers
-- BULK INSERT Customers
-- FROM 'D:\DataEngineeringResources\Data Engineering Projects\python\customers.csv'
-- WITH (
--     FORMAT = 'CSV',
--     FIRSTROW = 2,
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n'
-- );

-- Import Orders
BULK INSERT Orders
FROM 'D:\DataEngineeringResources\Data Engineering Projects\python\orders.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
