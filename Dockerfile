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