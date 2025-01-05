# Use the official Python base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the entire project into the container
COPY . .

# Create required directories (e.g., plots directory)
RUN mkdir -p /app/plots

# Set the default command to run your application (modify as necessary)
CMD ["python3", "main.py", "--mode", "test", "--data_path", "./data/test/", "--model_path", "./models/cnn_resnet18_freeze_backbone_False.pth"]
