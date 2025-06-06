FROM python:3.10-slim

WORKDIR /app

# Install ffmpeg and basic tools
#RUN apt-get update && \
  #  apt-get install -y ffmpeg supervisor && \
 #   apt-get clean && \
 #   rm -rf /var/lib/apt/lists/*

# Copy all project files
COPY . /app

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Add supervisord config
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD gunicorn app:app & python3 bot.py
