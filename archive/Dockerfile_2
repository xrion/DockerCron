# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the script file into the container at /usr/src/app
COPY script.sh .

# Make the script file executable
RUN chmod +x script.sh

# Install cron and curl
RUN apt-get update && apt-get -y install cron curl

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Apply cron job
RUN crontab /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
