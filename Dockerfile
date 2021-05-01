From ubuntu
RUN mkdir /app
WORKDIR /app
RUN apt-get update
COPY . /app/
RUN pip3 install -r requirements.txt
ENTRYPOINT python3 /app/manage.py
