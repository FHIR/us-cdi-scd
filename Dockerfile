FROM eclipse-temurin:17-jre
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git curl nodejs npm ruby build-essential zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install tools
RUN npm install -g fsh-sushi@3.20.0 && \
    gem install jekyll

# Copy project files
COPY . .

# Ensure build script is executable
RUN chmod +x _build.sh

# Default command to run the build
ENTRYPOINT ["./_build.sh", "build"]
