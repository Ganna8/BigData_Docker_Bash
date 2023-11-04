# Use the official Ubuntu as the base image
FROM ubuntu

# Update package list and install prerequisites
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker GPG key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add Docker repository and install Docker
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    && apt-get clean

# Install Python packages using pip
RUN pip3 install pandas numpy seaborn matplotlib scikit-learn scipy

# Create a directory inside the container at /home/doc-bd-a1/
RUN mkdir -p /home/doc-bd-a1

# Copy the dataset file from the host machine to the container
COPY traffic.csv /home/doc-bd-a1/
COPY eda.py /home/doc-bd-a1/
COPY vis.py /home/doc-bd-a1/
COPY model.py /home/doc-bd-a1/
COPY load.py /home/doc-bd-a1/
COPY dpre.py /home/doc-bd-a1/
COPY final.sh /home/doc-bd-a1/

# Set the working directory to /home/doc-bd-a1/
WORKDIR /home/doc-bd-a1

# Open the bash shell upon container startup
CMD ["bash"]
