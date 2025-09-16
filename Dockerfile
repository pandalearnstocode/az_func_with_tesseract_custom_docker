FROM mcr.microsoft.com/azure-functions/python:4-python3.13

# Install Tesseract OCR and dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    libleptonica-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Optional: install language packs (e.g. Hindi, German, etc.)
# RUN apt-get update && apt-get install -y tesseract-ocr-hin tesseract-ocr-deu

# Copy function code
COPY . /home/site/wwwroot

# Install Python dependencies
WORKDIR /home/site/wwwroot
RUN pip install --no-cache-dir -r requirements.txt
