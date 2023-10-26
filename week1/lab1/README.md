## Scenario

You are going to get the job data from an API. Please go to the API web page first (https://www.themuse.com/developers/api/v2), and take a look at the page. We will use Page 50 for this lab. So, let’s go to Job, and input 50 in the “page” field, and leave other fields blank. 

## Detail Steps

1. Create a storage account and blob container on Azure. You should have done this in your workshop.
Create a virtual machine on Azure. You should have finished it in your workshop.
Build your python Project on virtual machine via VSCode. (You need VSCode remotely SSH connect to VM)
Write a python script on the VM to finish the following tasks (don't forget to install the necessary libraries): 

2. Read the API (use requests library) b. get the necessary data: - “company name” - “locations”, - “job name”, - “job type”, - “publication date”, 

3. Convert the json data into a dataframe (use pandas library) 

4. Manipulate data: create a table include:** - company_name - country (cut the string of “locations”, keep the country part) - city (cut the string of “locations”, keep the city part) - Job_name - Job_type - Date (cut string of “publication date” only keep date part) This is the result sample:

## Requirements

In this project, there is no strict requirements for you to set a project package and config file, you can hard code the python script and directly run the python script.

## Install Conda Package Manager

### Get installer 
1. wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
### Add execution permission
2. chmod +x Miniconda3-latest-Linux-x86_64.sh
### Run the bach script
3. ./Miniconda3-latest-Linux-x86_64.sh
### Activate Installation
4.1 ~/miniconda3/bin/conda init bash (optional)
4.2 source ~/.bashrc 
### Verify Installation
5. conda lists
### Add channel
6. conda config --add channels conda-forge
### Create Environment
7. conda create --name lab1 python=3.9
### Install packages
8. conda install pandas requests
### install AZcopy
9. bash install-AzCopy.sh
### Run the script
10. python lab1.py


### Use AAD to Authenticate
azcopy login --tenant-id=<tenant-id>

### Use Service Principal to Authenticate
export AZCOPY_SPA_CLIENT_SECRET=<YOUR_APP_SECRET>
azcopy login --service-principal  --application-id application-id --tenant-id=tenant-id

### FIX: workaround if you are gwtting keyring issue
keyctl session