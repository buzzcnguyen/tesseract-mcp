FROM jitesoft/tesseract-ocr:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip tesseract-ocr-vie && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install "mcp[cli]" --break-system-packages

COPY ocr_mcp_server.py /app/ocr_mcp_server.py

ENTRYPOINT ["python3", "/app/ocr_mcp_server.py"]
