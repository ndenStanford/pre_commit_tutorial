FROM tiangolo/uvicorn-gunicorn-fastapi

# We copy just the requirements.txt first to leverage Docker cache
COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY app /app/