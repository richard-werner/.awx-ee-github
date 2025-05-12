FROM quay.io/ansible/awx-ee:latest

USER root

COPY requirements.yml /tmp/requirements.yml
COPY requirements.txt /tmp/requirements.txt

# Install Ansible collections and Python packages
RUN ansible-galaxy collection install -r /tmp/requirements.yml && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

# Ensure the ansible user exists and has a home dir
RUN id ansible || useradd --create-home --shell /bin/bash ansible

USER ansible