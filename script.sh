#!/bin/bash

echo "FROM python:3" > Dockerfile

echo "COPY requeriments.txt /home/." >> Dockerfile

echo "RUN pip install -r /home/requeriments.txt" >> Dockerfile

echo "EXPOSE 8090 " >> Dockerfile

echo "WORKDIR /home/app/" >> Dockerfile

echo "COPY server.py . " >> Dockerfile

echo "RUN mkdir templates" >> Dockerfile 

echo "COPY templates/index.html templates/." >> Dockerfile

echo "CMD python3 server.py" >> Dockerfile

docker stop samrun

docker rm samrun

docker build -t sample .

docker run -t -d -p 8090:8090 --name samrun sample

docker ps -a

