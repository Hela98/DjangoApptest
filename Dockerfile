From ubuntu
RUN apt-get update
RUN mkdir /app
WORKDIR /app

RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3 -y && apt-get install python3-pip -y
COPY . /app/
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN chmod a+x -R ${env.WORKSPACE}
RUN sudo chmod a+x /app/test.sh
RUN /app/test.sh
#ENTRYPOINT python3 /app/manage.py
CMD ['python3', '/app/manage.py']
