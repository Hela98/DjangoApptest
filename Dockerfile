From ubuntu
RUN apt-get update
RUN apt-get install python3 -y && apt-get install python3-pip -y
COPY . /opt/app_code
RUN pip3 install -r requirements.txt
ENTRYPOINT python3 /opt/app_code/manage.py
