FROM quay.io/ansible/awx-ee:latest

USER root

COPY requirements.yml /tmp/requirements.yml
COPY requirements.txt /tmp/requirements.txt

RUN ansible-galaxy collection install -r /tmp/requirements.yml && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

USER ansible