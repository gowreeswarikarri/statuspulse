# ---------- Builder Stage ----------
FROM python:3.11-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt

# ---------- Runtime Stage ----------
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl libpq5 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser

COPY --from=builder /root/.local /home/appuser/.local

COPY app/ .

ENV PATH=/home/appuser/.local/bin:$PATH

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
CMD curl -f http://localhost:8000/health || exit 1

CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "main:app", "-b", "0.0.0.0:8000"]
