#!/bin/bash

set -e
echo "A iniciar deployment..."

cd /home/appuser/go-notes

echo "A fazer git pull..."
git pull origin main

echo "hammer_and_wrench: A compilar..."
/usr/bin/go build -o go-notes-app .

echo "A reiniciar o serviço..."
sudo systemctl restart go-notes.service

echo "Deployment concluído com sucesso!"

