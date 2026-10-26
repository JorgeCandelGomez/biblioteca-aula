FROM python:3.12-alpine
WORKDIR /app

RUN apk add --no-cache gcc musl-dev postgresql-dev libffi-dev

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "3", "app:app"]