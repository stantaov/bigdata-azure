#!/usr/bin/python3

import requests
import pandas as pd
import subprocess
from typing import Tuple, List

def read_api(url: str) -> List[dict]:
    """
    Reads the API and returns the data.

    Args:
        url (str): The API endpoint URL to fetch data from.

    Returns:
        List[dict]: A list of dictionaries containing the job details.
    """
    response = requests.get(url)
    return response.json()['results']

def extract_data(data: List[dict]) -> Tuple[List[str], List[str], List[str], List[str], List[str]]:
    """
    Extracts and processes data from the API response.

    Args:
        data (List[dict]): List of dictionaries containing the job details from the API.

    Returns:
        Tuple: Contains lists of companies, locations, jobs, job types, and publication dates.
    """
    companies = [item['company']['name'] for item in data]
    locations = [item['locations'][0]['name'] for item in data]
    jobs = [item['name'] for item in data]
    job_types = [item['type'] for item in data]
    publication_dates = [item['publication_date'][:10] for item in data]
    
    return companies, locations, jobs, job_types, publication_dates

def create_dataframe(companies: List[str], locations: List[str], jobs: List[str], 
                     job_types: List[str], publication_dates: List[str]) -> pd.DataFrame:
    """
    Creates and returns a DataFrame from the extracted data.

    Args:
        companies (List[str]): List of company names.
        locations (List[str]): List of job locations.
        jobs (List[str]): List of job titles.
        job_types (List[str]): List of job types.
        publication_dates (List[str]): List of job publication dates.

    Returns:
        pd.DataFrame: A DataFrame containing the job details.
    """
    df = pd.DataFrame({
        'company': companies,
        'location': locations,
        'job': jobs,
        'job_type': job_types,
        'publication_date': publication_dates
    })

    # Split location into city and country
    df[['city', 'country']] = df['location'].str.split(',', expand=True)
    df.drop('location', axis=1, inplace=True)
    
    return df

def upload_to_blob(filename: str) -> None:
    """
    Uploads the file to Azure Blob Storage using azcopy.

    Args:
        filename (str): The path to the local file to be uploaded.
    """
    subprocess.run([
        'azcopy',
        'copy',
        filename,
        'https://adlswcdb8cc.blob.core.windows.net/demo',
        '--recursive=true'
    ])

if __name__ == '__main__':
    url = 'https://www.themuse.com/api/public/jobs?page=50'

    print('Reading the API...')
    data = read_api(url)
    print('API Reading Done!')

    print('Extracting data...')
    companies, locations, jobs, job_types, publication_dates = extract_data(data)
    print('Data extraction complete!')

    print('Creating DataFrame...')
    df = create_dataframe(companies, locations, jobs, job_types, publication_dates)
    df.to_csv('jobs.csv', index=False)
    print('Dataframe saved to local.')

    print('Uploading file...')
    upload_to_blob('jobs2.csv')
    print('File uploading Done!')
