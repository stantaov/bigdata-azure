-- Drop the function if it exists
DROP FUNCTION IF EXISTS LastLoadDate();

-- Create a new function
CREATE FUNCTION LastLoadDate() RETURNS SETOF timestamp AS $$
BEGIN
    RETURN QUERY SELECT ExecutionDate FROM ControlTable;
END;
$$ LANGUAGE plpgsql;

