FROM python:3.7-slim

WORKDIR /app

COPY . /app

RUN pip install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate && \
    pip install pyglet && \
    if [ "$(uname -s)" = 'Linux' ]; then echo "Skipping pywin32 on Linux"; else pip install pywin32; fi

CMD ["python", "was.py"]