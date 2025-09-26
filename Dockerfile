FROM alpine:3.19

# Install required packages
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    wget \
    unzip \
    ca-certificates

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install Bitwarden CLI
RUN wget https://github.com/bitwarden/clients/releases/download/cli-v2025.9.0/bw-linux-2025.9.0.zip && \
    unzip bw-linux-2025.9.0.zip && \
    chmod +x bw && \
    mv bw /usr/local/bin/ && \
    rm bw-linux-2025.9.0.zip

# Create non-root user
RUN adduser -D -s /bin/bash syncuser

USER syncuser
WORKDIR /home/syncuser

# Test the installations
RUN bw --version && kubectl version --client

CMD ["/bin/bash"]