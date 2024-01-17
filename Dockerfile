# Utiliser une image de base Python officielle
FROM python:3.8-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le reste du code de l'application dans le répertoire de travail
COPY . .

# Make the script file executable
RUN chmod +x script.sh

# Install cron and curl
RUN apt-get update && apt-get -y install cron curl

# Give execution rights on the cron job
RUN chmod 0644 simple-cron

# Apply cron job
RUN crontab simple-cron

# Create the log file to be able to run tail
RUN touch cron.log

# Run the command on container startup
CMD cron && tail -f cron.log