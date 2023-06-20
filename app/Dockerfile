# Use the official Python base image
FROM python:3.9.17-alpine3.18

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code into the container
COPY app.py .

#create a non-root user and Set the ownership of the application directory to the non-root user
RUN adduser -D nonrootuser \
    && chown -R nonrootuser:nonrootuser /app

# Switch to the non-root user
USER nonrootuser

#Expose port 80
EXPOSE 8080

# Set the command to run the application
ENTRYPOINT ["python", "app.py"]