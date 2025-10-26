# specifies the Parent Image from which you are building.
FROM python:3.9

# specify the working directory for the image
WORKDIR /code

# TODO
# copy and install requirements (simple and cache-friendly)
COPY requirements.txt /code/requirements.txt
RUN pip install --upgrade pip \
    && pip install -r /code/requirements.txt

# copy application code
COPY ./app /code/app

EXPOSE 8080

# uvicorn will import the FastAPI "app" object from app/main.py
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
