-- Drop the function if it exists
DROP FUNCTION IF EXISTS UpdateLastExecutionDate(TIMESTAMP);

-- Create a new function
CREATE FUNCTION UpdateLastExecutionDate(p_executiondate TIMESTAMP) RETURNS void AS $$
BEGIN
    UPDATE ControlTable 
    SET ExecutionDate = p_executiondate;
END;
$$ LANGUAGE plpgsql;
