FROM python:3.7-slim

WORKDIR /app

COPY . /app

RUN pip install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate && \
    pip install pywin32 pyglet

CMD ["python", "was.py"]