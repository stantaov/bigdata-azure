-- Drop the table if it exists
DROP TABLE IF EXISTS public.AzureMetadataTest;

-- Create the table
CREATE TABLE public.AzureMetadataTest (
    FileName VARCHAR(50),
    LastModifiedDate TIMESTAMP,
    RecordInsertDate TIMESTAMP
);

