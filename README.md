<h1 align="center">Atlantbh DevOps Internship</h1>

![adinpilavdzija-devops-github](https://github.com/adinpilavdzija/devops-internship-atlantbh/assets/65655945/8d7b8220-3822-48bb-ad02-c1c439943d45)

During `ABH Internship`, interns work on a project with one-on-one mentorship from an Atlantbh engineer. The DevOps Engineer intern will work on raising the application quality as well as the development of tools and practices needed for the successful release of your application to production. By the end of the internship, the intern will be acquainted with the tools necessary for setting up and managing Continuous Integration and automated deployment processes (bash scripting/Docker/Kubernetes/Jenkins), as well as cloud computing infrastructure management (Amazon Web Services).

The repository encompasses the main `README.md` file, individual task folders with their corresponding `README.md` files, and possibly accompanying screenshots or other files. Additionally, it includes the main application separated in two folders, namely `spring-petclinic-angular` and `spring-petclinic-rest`. Each `README.md` file within the task folders provides overview and comprehensive instructions for completing the associated task.

<img name="devops-forthebadge" src="https://github.com/adinpilavdzija/devops-internship-atlantbh/assets/65655945/41e74e48-5c09-4a4a-9be8-3cc3f34383f8" align="right" />

>**Note** 
MacOS: Ventura 13.3  
Start date: October 9, 2023  
End date: 🔴

<p align="left">
    <img src="https://skillicons.dev/icons?i=git,github,bash,vim,vscode,java,maven,angular,postgres,docker"/>
</p>

## Table of contents

Table of contents has been removed due to built-in support on GitHub. Markdown files now automatically generate a table of contents in the header when there are 2 or more headings. The table of contents is interactive and links to the selected section. All 6 Markdown heading levels are supported.

<details>
  <summary>Where to find it:</summary>

  ![Table of contents - gif](https://i0.wp.com/user-images.githubusercontent.com/7900087/113821370-df915480-9730-11eb-8aed-bdc50e2212d5.gif?ssl=1)
</details>

## Homebrew

[Homebrew](https://brew.sh/) is the easiest and most flexible way to install the UNIX tools Apple didn’t include with macOS. It can also install software not packaged for your Linux distribution without requiring sudo. Explore [man page](https://docs.brew.sh/Manpage) for more information.

Update Homebrew before installing new packages.
```
$ brew update #to update brew

$ brew doctor #to run diagnostics

$ brew upgrade #to upgrade packages

$ brew list #to see a list of all the packages you've installed
```

## spring-petclinic-rest

[`spring-petclinic-rest`](https://github.com/spring-petclinic/spring-petclinic-rest) is the backend version of the Spring Petclinic application provides a REST API. The repository contains a [cloned version with the incorporated changes](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/spring-petclinic-rest).

## spring-petclinic-angular

[`spring-petclinic-angular`](https://github.com/spring-petclinic/spring-petclinic-angular) is the Angular frontend application which consumes the REST API. The repository contains a [cloned version with the incorporated changes](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/spring-petclinic-angular).

> **Warning**
> Client only. Use REST API from backend spring-petclinic-rest project. You need to start backend server before you start frontend application.

## First month

<details>
  <summary></summary>

### 00 Setup Linux VM

Linux based OS is mandatory for DevOps internship program. Disposable Virtual Machine (VM) needs to be created for learning purpose and potentially for future tasks. Any Linux based OS is acceptable. Graphical User Interface (GUI) is optional, but not needed.

Recommended VM tools:
- Multipass
- Vagrant
- Qemu
- VirtualBox
- Any other available tool

Recommended OS:
- Ubuntu (Desktop or Server)
- Debian
- Fedora
- CentOS
- Any other Linux based distribution (check DistroWatch)

### [01 Bash scripting](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/01-bash-scripting)

Task:
- 01 Write a script that gets CPU and Memory usage
- 02 Write a script that tests connectivity to a list of websites and reports the status
- 03 Write a script that pings a host and reports latency
- 04 Write a script that traces the path of a network packet from the source to a destination
- 05 Write a script that tests the DNS resolution time for a list of domains

### [02 Setup local environment for backend app](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/02-setup-local-env-backend)

Task: Clone spring-petclinic-rest repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

### [03 Setup local environment for frontend app](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/03-setup-local-env-frontend)

Task: Clone spring-petclinic-angular repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

### [04 Deploy functional Spring Petclinic App](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/04-deploy-functional-app)

Task: Deploy both frontend and backend spring-petclinic apps. Verify the frontend app is integrated with backend.

### [05 Setup PostgreSQL database](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/05-setup-postgresql-db)

Task: Spring petclinic rest app uses in memory storage by default. There is option to persist data beyond restarts using database. Create local PostgreSQL database which will be used for data persistence.

### [06 Deploy Backend with PostgreSQL integration](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/06-backend-postgresql-integration🔴)

Task: Deploy Backend with PostgreSQL integration.

### [07 Reconfigure Frontend and Backend apps to use environment variables](https://github.com/adinpilavdzija/devops-internship-atlantbh/tree/develop/07-environment-variables)

Task: Variables like hostname, username and password often need to be changed. Configure frontend and backend apps to use environment variables for REST_API_URL, Postgres datasource.url, username and password. Fork/clone frontend and backend repositories and make changes (including changes in future tasks) in these repositories.

[Add `.gitignore`](https://github.com/adinpilavdzija/devops-internship-atlantbh/commit/29a79bcb458f4aac729b0d80a7ae8cfb54ab0456)<br>
[Code changes](https://github.com/adinpilavdzija/devops-internship-atlantbh/commit/1f9b95c1855c840c8637bc02ae78911041f3fe9c)

### 08 Dockerize Frontend, Backend and Postgres services

Task:
- Create Backend Dockerfile and build docker image
- Create Frontend Dockerfile and build docker image
- Create Database Dockerfile and build docker image
- Push docker images to docker hub
- Deploy functional spring petclinic app using docker containers
- Add volume to PostgreSQL docker container
- Create Docker network for spring petclinic containers

[]()

### 09 Create docker-compose file for spring petclinic app

Task: Create docker-compose file for spring petclinic app

[]()

</details>

## Second month

<p align="center">
    🔵⚪⚫
</p>
