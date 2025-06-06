# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install ffmpeg and required system packages
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run gunicorn and bot.py in parallel
CMD gunicorn app:app --bind 0.0.0.0:8000 & python bot.py
