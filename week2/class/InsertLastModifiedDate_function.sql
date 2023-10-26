-- Drop the function if it exists
DROP FUNCTION IF EXISTS public.InsertLastModifiedDate(varchar, timestamp, timestamp);

-- Create the function
CREATE OR REPLACE FUNCTION public.InsertLastModifiedDate(
    p_FileName varchar(50), 
    p_ModifiedDate timestamp, 
    p_RecordInsertDate timestamp
) RETURNS void AS $$
BEGIN
    INSERT INTO public.AzureMetadataTest (FileName, LastModifiedDate, RecordInsertDate)
    VALUES (p_FileName, p_ModifiedDate, p_RecordInsertDate);
END;
$$ LANGUAGE plpgsql;