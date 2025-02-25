# Use Amazon Linux 2023 as the base image
FROM amazonlinux:2023

# Set environment variables for non-interactive installations
ENV LANG C.UTF-8

# Update the system and install required tools
RUN echo "Installing required tools" && \
    yum update -y && \
    yum install -y tar gzip unzip jq && \
    yum install java-17-amazon-corretto -y && \
    echo "Java installed successfully" && \  
    # Install Maven
    echo "Installing Maven" && \
    yum install -y maven && \  
    # Install AWS CLI
    echo "Installing AWS CLI" && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    echo "AWS CLI installed successfully" && \
    # Install Git
    yum install git -y && \
    # Print versions of Java, Maven, and AWS CLI
    java -version && \
    mvn -v && \
    git --version && \
    aws --version
    

# Set the default command to run
CMD ["/bin/bash"]
