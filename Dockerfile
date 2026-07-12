FROM jitesoft/tesseract-ocr:latest

RUN apt update && \
    apt install -y python3 python3-pip tesseract-ocr-vie && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install "mcp[cli]" --break-system-packages

COPY ocr_mcp_server.py /app/ocr_mcp_server.py

ENTRYPOINT ["python3", "/app/ocr_mcp_server.py"]
