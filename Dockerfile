FROM kutt/kutt

# Install required tools
RUN apt-get update RUN apt-get install -y curl

# Copy over the docker-compose file
COPY ./docker-compose.yaml .

# Create environment file
ENV DB_HOST=postgres ENV DB_NAME=kutt ENV DB_USER=user ENV DB_PASSWORD=pass ENV REDIS_HOST=redis

VOLUME redis_data:/data VOLUME postgres_data:/var/lib/postgresql/data

# Start the application
CMD ["./wait-for-it.sh", "postgres:5432", "--", "npm", "start"] EXPOSE 3000
