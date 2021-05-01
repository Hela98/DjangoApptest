From python:3.6
RUN apt-get update
RUN apt-get install python3 -y && apt-get install python3-pip -y
RUN pip3 install --upgrade pip3
RUN pip3 install requirements.txt
COPY . /opt/app_code
ENTRYPOINT python3 /opt/app_code/manage.py
