From ubuntu
RUN mkdir /app
WORKDIR /app
RUN apt-get update
RUN apt-get install python3 -y && apt-get install python3-pip -y
COPY . /app/
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
ENTRYPOINT python3 /app/manage.py
