# Base Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install Node.js
USER root

# Install curl and Node.js 24.x
RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Verify installation
RUN node -v
RUN npm -v

# Switch back to Jenkins user
USER jenkins

# Expose default Jenkins port
EXPOSE 8080

# Entry point is already defined in the base image
