# Use an official base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the bash script into the container
COPY hello.sh .

# Make the script executable
RUN chmod +x hello.sh

# Run the bash script
CMD ["./hello.sh"]
