# HR Management System

A Spring Boot-based Human Resources Management System for managing employees, departments, managers, and user authentication.

The project is also being developed as a **DevOps-oriented application**, with a roadmap covering containerization, CI/CD, code quality, and application monitoring.

---

## 📌 Overview

The HR Management System provides a web application and REST APIs for managing HR-related information.

The application is built with **Spring Boot** and follows a layered architecture separating controllers, services, repositories, and domain models.

### Main functionalities

* Employee management
* Department management
* Manager management
* User credential management
* Authentication and authorization
* REST API
* Web interface
* Exception handling
* Database integration
* Swagger / OpenAPI documentation
* Environment-specific configuration

---

## 🏗️ Architecture

The application follows a layered architecture:

```text
                    ┌─────────────────────┐
                    │       Client        │
                    │ Web / REST Client   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Controllers      │
                    │ Web + REST APIs     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Services       │
                    │ Business Logic      │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Repositories     │
                    │   Spring Data JPA   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Database       │
                    └─────────────────────┘
```

---

## 🛠️ Technologies

### Backend

* Java
* Spring Boot
* Spring MVC
* Spring Data JPA
* Spring Security
* Hibernate
* Maven

### Frontend

* Thymeleaf
* HTML
* CSS

### API

* REST API
* Swagger / OpenAPI

### Database

* SQL
* MySQL / relational database
* SQL Server database script

### DevOps Roadmap

* Docker
* Docker Compose
* GitHub Actions
* SonarQube
* Prometheus
* Grafana

---

## 📂 Project Structure

```text
hr-management-system/
│
├── .mvn/
│   └── wrapper/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/selimhorri/app/pack/
│   │   │       ├── configs/
│   │   │       ├── controllers/
│   │   │       ├── exceptions/
│   │   │       ├── models/
│   │   │       ├── repositories/
│   │   │       ├── security/
│   │   │       └── services/
│   │   │
│   │   └── resources/
│   │       ├── templates/
│   │       ├── META-INF/
│   │       └── application*.properties
│   │
│   └── test/
│       └── java/
│
├── hr_schema_data_db.sql
├── hr_schema_data_db_Sql_Server.sql
├── Dockerfile
├── pom.xml
├── mvnw
├── mvnw.cmd
├── .gitignore
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

* Java JDK
* Git
* A relational database
* Docker (optional for the current version)

Verify Java:

```bash
java -version
```

Verify Git:

```bash
git --version
```

---

## 📥 Clone the Repository

```bash
git clone https://github.com/khaled-Essmairia/hr-management-system---GithubActions.git
```

Navigate to the project:

```bash
cd hr-management-system---GithubActions
```

---

## ⚙️ Configuration

The application provides different Spring Boot configuration profiles:

```text
application.properties
application-dev.properties
application-qa.properties
application-prod.properties
```

Before running the application, configure the database connection according to your environment.

### Environment variables

For production environments, sensitive information such as database credentials should be provided using environment variables instead of committing passwords to Git.

Example:

```properties
spring.datasource.username=${DB_USERNAME}
spring.datasource.password=${DB_PASSWORD}
```

---

## 🗄️ Database

SQL scripts are provided in the root directory:

```text
hr_schema_data_db.sql
hr_schema_data_db_Sql_Server.sql
```

These scripts can be used to initialize the database depending on the selected database engine.

---

## ▶️ Running the Application

### Using Maven Wrapper

On Linux/macOS:

```bash
./mvnw spring-boot:run
```

On Windows:

```cmd
mvnw.cmd spring-boot:run
```

### Using Maven

```bash
mvn spring-boot:run
```

After starting the application, access it through:

```text
http://localhost:8080
```

---

## 🧪 Running Tests

Run the test suite using:

```bash
./mvnw test
```

On Windows:

```cmd
mvnw.cmd test
```

---

## 📚 API Documentation

The application includes Swagger / OpenAPI configuration.

After starting the application, Swagger UI can be accessed at:

```text
http://localhost:8080/swagger-ui/index.html
```

The exact endpoint may depend on the Swagger/OpenAPI version configured in the project.

---

## 🐳 Docker

The application includes a `Dockerfile` for containerizing the Spring Boot application.

Build the Docker image:

```bash
docker build -t hr-management-system .
```

Run the container:

```bash
docker run -p 8080:8080 hr-management-system
```

Docker Compose will be introduced as part of the DevOps roadmap.

---

# 🔄 CI/CD

GitHub Actions will be used to automate the software delivery pipeline.

### Planned pipeline

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ├── Build
    │
    ├── Unit Tests
    │
    ├── SonarQube Analysis
    │
    ├── Docker Build
    │
    └── Docker Image Push
```

### Planned CI/CD features

* Automated Maven build
* Automated unit tests
* Code quality analysis
* SonarQube integration
* Docker image creation
* Docker image publishing
* Deployment automation

---

# 🔍 Code Quality

SonarQube will be integrated into the CI/CD pipeline to analyze:

* Code quality
* Bugs
* Vulnerabilities
* Code smells
* Test coverage
* Maintainability

Planned workflow:

```text
GitHub Actions
      │
      ▼
Maven Build
      │
      ▼
Tests
      │
      ▼
SonarQube Analysis
      │
      ▼
Quality Gate
```

---

# 📊 Monitoring

Application monitoring will be implemented using:

* Spring Boot Actuator
* Micrometer
* Prometheus
* Grafana

Planned architecture:

```text
              ┌──────────────────────┐
              │   Spring Boot App    │
              │                      │
              │   Actuator/Metrics   │
              └──────────┬───────────┘
                         │
                         ▼
                ┌─────────────────┐
                │    Prometheus   │
                │ Metrics Storage │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │     Grafana     │
                │    Dashboard    │
                └─────────────────┘
```

Grafana dashboards will eventually provide visibility into application health and performance.

---

# 🐳 Docker Compose Roadmap

The future Docker Compose environment will contain the main application and DevOps infrastructure.

Planned services:

```text
┌───────────────────────────────────────────────┐
│                Docker Compose                 │
│                                               │
│  ┌─────────────┐      ┌─────────────┐         │
│  │ Spring Boot │─────▶│  Database   │         │
│  │ Application │      └─────────────┘         │
│  └──────┬──────┘                              │
│         │                                     │
│         ▼                                     │
│  ┌─────────────┐      ┌─────────────┐         │
│  │ Prometheus  │─────▶│   Grafana   │         │
│  └─────────────┘      └─────────────┘         │
│                                               │
└───────────────────────────────────────────────┘
```

---

# 🗺️ DevOps Roadmap

The project is being progressively enhanced with DevOps practices.

### Application

* [x] Spring Boot application
* [x] Employee management
* [x] Department management
* [x] Authentication and authorization
* [x] REST API
* [x] Swagger / OpenAPI
* [x] Database integration
* [x] Unit/integration test structure

### Containerization

* [x] Dockerfile
* [ ] Docker Compose
* [ ] Multi-container environment
* [ ] Environment-based configuration

### CI/CD

* [ ] GitHub Actions
* [ ] Automated build
* [ ] Automated tests
* [ ] SonarQube analysis
* [ ] Quality Gate
* [ ] Docker image build
* [ ] Docker image publishing
* [ ] Automated deployment

### Monitoring

* [ ] Spring Boot Actuator
* [ ] Micrometer
* [ ] Prometheus
* [ ] Grafana
* [ ] Application dashboards
* [ ] JVM monitoring
* [ ] HTTP request metrics

---

# 🔐 Security

The project uses Spring Security for authentication and authorization.

Sensitive configuration must not be committed to the repository.

The following files and values should remain outside Git:

```text
.env
Database passwords
API keys
Access tokens
Private credentials
Production secrets
```

Use environment variables or a dedicated secret-management solution for sensitive configuration.

---

# 🧑‍💻 Development

### Recommended workflow

```text
Create Feature
     │
     ▼
Develop
     │
     ▼
Run Tests
     │
     ▼
Git Commit
     │
     ▼
Git Push
     │
     ▼
GitHub Actions
     │
     ▼
Build + Test + Quality Analysis
```

### Commit convention

The project follows conventional commit-style messages.

Examples:

```text
feat: add employee management
fix: resolve employee validation issue
test: add employee service tests
build: add Docker configuration
ci: add GitHub Actions pipeline
monitoring: add Prometheus configuration
docs: update project documentation
refactor: improve service layer
chore: update project configuration
```

---

# 📌 Current Status

The core Spring Boot HR Management System is implemented.

The DevOps infrastructure is being introduced progressively.

Current focus:

```text
Spring Boot
    │
    ▼
Docker
    │
    ▼
Docker Compose
    │
    ▼
GitHub Actions
    │
    ▼
SonarQube
    │
    ▼
Prometheus
    │
    ▼
Grafana
```

---

# 📈 Future Improvements

Future versions may include:

* Advanced employee search
* Pagination and sorting
* Improved authentication
* Role-based access control
* API versioning
* Automated integration testing
* Docker image optimization
* CI/CD deployment
* Centralized logging
* Application monitoring
* Grafana dashboards
* Performance monitoring
* Security scanning

---

## 👨‍💻 Author

**Khaled Essmairia**

GitHub: [khaled-Essmairia](https://github.com/khaled-Essmairia)

---

## 📄 License

This project is intended for educational, development, and portfolio purposes.
