-- Drop the table if it exists
DROP TABLE IF EXISTS ControlTable;

-- Create a new table
CREATE TABLE ControlTable(
	Source CHAR(10),
	ExecutionDate TIMESTAMP
);

-- Insert data into the table
INSERT INTO ControlTable (Source, ExecutionDate) VALUES('Sales', '2022-09-13 00:31:34.910');

