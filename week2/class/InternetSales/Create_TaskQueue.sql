-- Drop the table if it exists
DROP TABLE IF EXISTS TaskQueue;

-- Create a new table
CREATE TABLE TaskQueue(
    FileName VARCHAR(100),
    Status INT,
    InsertDate TIMESTAMP
);

