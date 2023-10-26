-- Drop the function if it exists
DROP FUNCTION IF EXISTS InsertFileNames(VARCHAR, INT, TIMESTAMP);

-- Create a new function
CREATE FUNCTION InsertFileNames(p_filename VARCHAR(50), p_status INT DEFAULT 0, p_dateinserted TIMESTAMP) RETURNS void AS $$
BEGIN
    INSERT INTO TaskQueue (FileName, Status, InsertDate)
    VALUES(p_filename, p_status, p_dateinserted);
END;
$$ LANGUAGE plpgsql;

