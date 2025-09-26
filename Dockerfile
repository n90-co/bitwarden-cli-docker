FROM node:20-alpine

# Install required packages
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    wget \
    ca-certificates

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install Bitwarden CLI via npm
RUN npm install -g @bitwarden/cli

# Create non-root user
RUN adduser -D -s /bin/bash syncuser

USER syncuser
WORKDIR /home/syncuser

CMD ["/bin/bash"]