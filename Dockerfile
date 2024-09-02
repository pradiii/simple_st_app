FROM python:3.10-slim
EXPOSE 8501

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*
    
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["streamlit","run","app.py", "--server.port=8501","--server.address=0.0.0.0"]
