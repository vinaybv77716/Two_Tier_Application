# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container and run all application in this folder
WORKDIR /app

# install required packages for system, Mysql liberiary, temove all temp files and lists
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container i.e target
COPY requirements.txt .

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Specify the command to run your application
CMD ["python", "app.py"]

