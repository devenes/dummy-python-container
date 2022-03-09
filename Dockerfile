FROM python:3.8-slim-buster
WORKDIR /app
ADD requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
RUN mkdir logs \ 
    && touch ./logs/dummy.log \
    && chmod 777 ./logs/dummy.log
EXPOSE 8080
CMD ["python", "./dummy.py"] 



# FROM python:alpine
# WORKDIR /usr/src/app
# COPY requirements.txt ./
# RUN pip3 install -r requirements.txt
# COPY . .
# EXPOSE 8080
# CMD python ./dummy.py 