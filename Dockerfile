FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
        git curl ca-certificates \
        libnss3 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libcups2 \
        libdrm2 \
        libxkbcommon0 \
        libxcomposite1 \
        libxdamage1 \
        libxfixes3 \
        libxrandr2 \
        libgbm1 \
        libasound2t64 \
        libpangocairo-1.0-0 \
        libpango-1.0-0 \
        libcairo2 \
        libgdk-pixbuf-xlib-2.0-0 \
        libgtk-3-0t64 \
        libx11-xcb1 \
        libxcb-dri3-0 \
        libxshmfence1 \
        fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/minatox-x/Turnstile-Solver-NEW solver
RUN pip install --no-cache-dir -r solver/requirements.txt
RUN patchright install chrome

COPY parse_json.py /app/parse_json.py
