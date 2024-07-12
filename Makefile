FRONTEND_DIR := $(shell pwd)/teste-front
BACKEND_DIR := $(shell pwd)/teste-back

FRONTEND_CMD := npm install
BACKEND_CMD := ./mvnw clean package

install: frontend backend

frontend:
	cd $(FRONTEND_DIR) && $(FRONTEND_CMD)

backend:
	cd $(BACKEND_DIR) && $(BACKEND_CMD)

up:
	docker compose up -d
down:
	docker compose down
