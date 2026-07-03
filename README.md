# 🐳 Docker Test Application with Node.js, MongoDB & Mongo Express

A simple full-stack application demonstrating how to containerize a Node.js application using Docker and connect it with MongoDB and Mongo Express using Docker networking and Docker Compose.

---

## 📌 Project Overview

This project demonstrates the complete Docker workflow from creating containers manually to using Docker Compose.

The application is built using:

- Node.js
- Express.js
- MongoDB
- Mongo Express
- Docker
- Docker Compose

The Node.js application stores and retrieves user data from MongoDB, while Mongo Express provides a web interface to manage the database.

---

# 🚀 Features

- Node.js Express Server
- MongoDB Database
- Mongo Express UI
- Docker Containerization
- Docker Networking
- Docker Compose
- Build Custom Docker Image
- Push Docker Image to Docker Hub

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| Node.js | Backend Runtime |
| Express.js | Web Framework |
| MongoDB | NoSQL Database |
| Mongo Express | MongoDB Web UI |
| Docker | Containerization |
| Docker Compose | Multi-container Management |
| Docker Hub | Image Repository |

---

# 📂 Project Structure

```
docker-testapp-main/
│
├── public/
│   ├── index.html
│   ├── style.css
│   └── script.js
│
├── server.js
├── package.json
├── package-lock.json
├── Dockerfile
├── mongodb.yaml
├── .gitignore
└── README.md
```

---

# ⚙️ Prerequisites

Before running this project, install:

- Docker Desktop
- Node.js
- Git

---

# 📥 Clone Repository

```bash
git clone https://github.com/Yellanki-Ashish/Docker_Testapp.git

cd Docker_Testapp
```

---

# 📦 Install Dependencies

```bash
npm install
```

---

# 🐳 Method 1: Run Containers Manually

## Create Docker Network

```bash
docker network create mongo-network
```

---

## Run MongoDB Container

```bash
docker run -d ^
-p 27017:27017 ^
--name mongo ^
--network mongo-network ^
-e MONGO_INITDB_ROOT_USERNAME=admin ^
-e MONGO_INITDB_ROOT_PASSWORD=qwerty ^
mongo
```

---

## Run Mongo Express Container

```bash
docker run -d ^
-p 8081:8081 ^
--name mongo-express ^
--network mongo-network ^
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin ^
-e ME_CONFIG_MONGODB_ADMINPASSWORD=qwerty ^
-e ME_CONFIG_MONGODB_URL=mongodb://admin:qwerty@mongo:27017 ^
mongo-express
```

---

## Verify Running Containers

```bash
docker ps
```

Expected Output

```
mongo
mongo-express
```

---

# 🐳 Method 2: Using Docker Compose

Start all containers

```bash
docker compose -f mongodb.yaml up -d
```

Stop containers

```bash
docker compose -f mongodb.yaml down
```

Check running containers

```bash
docker ps
```

---

# 🏗️ Build Docker Image

```bash
docker build -t docker-testapp-main:1.0 .
```

Check images

```bash
docker images
```

---

# ▶️ Run Application

```bash
docker run docker-testapp-main:1.0
```

---

# 🐋 Docker Hub

Build image

```bash
docker build -t ashishyellanki/docker-testapp .
```

Login

```bash
docker login
```

Push image

```bash
docker push ashishyellanki/docker-testapp
```

Docker Hub Repository

```
https://hub.docker.com/r/ashishyellanki/docker-testapp
```

---

# 🌐 Application URLs

### Node Application

```
http://localhost:5050
```

### Mongo Express

```
http://localhost:8081
```

Username

```
admin
```

Password

```
qwerty
```

---

# 📚 What I Learned

During this project, I learned:

- Docker installation and setup
- Docker images and containers
- Creating Docker networks
- Running MongoDB inside Docker
- Running Mongo Express
- Connecting containers using Docker Network
- Docker Compose
- Writing Dockerfile
- Building Docker images
- Running containers from images
- Docker Hub login
- Pushing custom images to Docker Hub
- Troubleshooting Docker errors
- Connecting Node.js with MongoDB

---

# 📸 Screenshots

Add screenshots here:

- Docker Desktop
- Running Containers
- Docker Compose
- Node Application
- Mongo Express
- Docker Images

Example

```
screenshots/
│
├── docker-desktop.png
├── docker-ps.png
├── docker-compose.png
├── application.png
└── mongo-express.png
```

---

# 👨‍💻 Author

**Yellanki Ashish**

B.Tech Computer Science Engineering (AI & ML)

Malla Reddy University

GitHub:
https://github.com/Yellanki-Ashish

---

# ⭐ If you found this project useful, please give it a Star.

---

# 📡 API Endpoints

This application exposes REST APIs to interact with the MongoDB database.

## 1️⃣ Get All Users

**Endpoint**

```http
GET /getUsers
```

**Description**

Retrieves all user records stored in the MongoDB database.

**URL**

```
http://localhost:5050/getUsers
```

**Sample Response**

```json
[
  {
    "_id": "6864d123456789abcdef1234",
    "name": "Ashish",
    "email": "ashish@gmail.com"
  },
  {
    "_id": "6864d123456789abcdef1235",
    "name": "Rahul",
    "email": "rahul@gmail.com"
  }
]
```

---

## 2️⃣ Add New User

**Endpoint**

```http
POST /addUser
```

**Description**

Adds a new user to the MongoDB database.

**URL**

```
http://localhost:5050/addUser
```

**Request Body**

```json
{
  "name": "Ashish",
  "email": "ashish@gmail.com"
}
```

**Success Response**

```text
User Added Successfully
```

---

## 🗄️ Database Details

| Property | Value |
|----------|-------|
| Database | apnacollege-db |
| Collection | users |

---

## 🔄 Application Workflow

```
Client (Browser)
        │
        ▼
Node.js Express Server
        │
        ├── POST /addUser
        │         │
        │         ▼
        │    Insert User into MongoDB
        │
        └── GET /getUsers
                  │
                  ▼
          Retrieve Users from MongoDB
                  │
                  ▼
             JSON Response
```

---