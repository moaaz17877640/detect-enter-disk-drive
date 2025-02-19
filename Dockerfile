# Use a Windows-based Python image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Python
RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.7.9/python-3.7.9-amd64.exe -OutFile python-3.7.9-amd64.exe; \
    Start-Process python-3.7.9-amd64.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -NoNewWindow -Wait; \
    Remove-Item -Force python-3.7.9-amd64.exe

WORKDIR /app

COPY . /app

RUN pip install virtualenv && \
    virtualenv venv && \
    .\venv\Scripts\activate && \
    pip install pywin32 pyglet

CMD ["python", "was.py"]