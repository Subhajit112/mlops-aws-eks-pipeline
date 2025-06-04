
FROM python:3.9
WORKDIR /app
COPY app/ /app/
COPY model/ /app/model/
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "main.py"]
