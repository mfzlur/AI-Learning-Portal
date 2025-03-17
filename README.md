# AI Learning Agent for Seek Portal

## Description  
This repository hosts the development of an **AI-powered learning agent** for the **Seek portal**, designed to enhance the learning experience of users. The agent **analyzes learning patterns**, **recommends personalized content**, and **optimizes the learning cycle** based on user engagement, skill progression, and feedback.

## Team Members  

| Name                        | Role Number                         | Email Address                      |  
|-----------------------------|------------------------------------|------------------------------------|  
| **Jacob Lazar**             | 23f1001427                         | 23f1001427@ds.study.iitm.ac.in    |  
| **Md Fazlur Rahman**        | 23f1001897                         | 23f1001897@ds.study.iitm.ac.in    |  
| **M P Shri Veena**          | 21f3001238                         | 21f3001238@ds.study.iitm.ac.in    |  
| **Aaditya Uday Ghaisas**    | 23f1002315                         | 23f1002315@ds.study.iitm.ac.in    |  
| **AMMAR SAJID**             | 22f2000713                         | 22f2000713@ds.study.iitm.ac.in    |  
| **Bhavya Gupta**            | 23f1001542                         | 23f1001542@ds.study.iitm.ac.in    |  
| **Aaryan Mayur Koulavkar**  | 23f1001125                         | 23f1001125@ds.study.iitm.ac.in    |  


## Setup
Paste .env file in ./backend directory. (Not to be committed in Git).

## Frontend
Go to ./vue and execute `npm run dev`  

execute `npm install` first _if you are getting npm error enoent Could not read package.json:_


# Backend Setup Guide

## Prerequisites
Ensure you have the following installed on your system:
- Python (>=3.7)
- pip (Python package manager)

## Setting Up the Virtual Environment
It is recommended to use a virtual environment to manage dependencies. Follow these steps:

### **1. Create a Virtual Environment**
Run the following command in your project directory:

```bash
python -m venv venv
```

### **2. Activate the Virtual Environment**
- **Windows**:
  ```bash
  venv\Scripts\activate
  ```
- **Mac/Linux**:
  ```bash
  source venv/bin/activate
  ```

### **3. Install Dependencies**
Once the virtual environment is activated, install the required packages:

```bash
pip install -r requirements.txt
```

## Running the Application
After setting up the environment and installing dependencies, run the application:

```bash
python main.py
```

## Deactivating the Virtual Environment
After you are done, you can deactivate the virtual environment by running:

```bash
deactivate
```

---

# Running AI assisstant on your local machine

## Clone the Repository
First, clone the repository to your local machine:
```sh
git clone https://github.com/aaryan-mk/LLMs_TEST/tree/master
cd LLM_TEST
```

## activate python virtual environment

## Install Dependencies
Install the required packages using:
```sh
pip install -r reqx.txt
```

## Run the Application
Start the application with:
```sh
python app.py
```

## Validate apis on swagger

- copy the contents of backend/team7-t125-mile4.yaml
- paste it on swagger editor
- test your apis

make sure your server is running locally on port:5000


## Running tests 
- Change directory to backend
- Run pytest

```bash
cd backend
python -m pytest
```
