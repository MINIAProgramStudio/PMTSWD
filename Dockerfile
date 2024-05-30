# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Check if requirements.txt exists and install any needed packages specified in it
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Run main.py when the container launches
ENTRYPOINT ["python", "main.py"]

# Default command to run unit tests (this can be overridden when running the container)
CMD "test_functions.py"