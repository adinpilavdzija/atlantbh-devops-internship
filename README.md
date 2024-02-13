<h1 align="center">Atlantbh DevOps Internship</h1>

<p align="center">
  <img width="500" src="/resources/atlantbh_devops_logo.png">
</p>

During `ABH Internship`, interns work on a project with one-on-one mentorship from an Atlantbh engineer. The DevOps Engineer intern will work on raising the application quality as well as the development of tools and practices needed for the successful release of your application to production. By the end of the internship, the intern will be acquainted with the tools necessary for setting up and managing Continuous Integration and automated deployment processes (bash scripting/Docker/Kubernetes/GitHub Actions), as well as cloud computing infrastructure management (Amazon Web Services).

The repository encompasses this main `README.md` file offering essential guidance, individual task folders with their corresponding `README.md` files and, optionally,  screenshots or other files. Each `README.md` file within the task folders provides overview and comprehensive instructions for completing the associated task. Additionally, repository includes the main application located in `00-spring-petclinic-deployment` directory. Most of the diagrams in repo I've created were made entirely from scratch.

<img name="devops-forthebadge" src="https://github.com/adinpilavdzija/devops-internship-atlantbh/assets/65655945/41e74e48-5c09-4a4a-9be8-3cc3f34383f8" align="right"/>

> MacOS: Ventura 13.3  
> Start date: October 9, 2023  
> End date: Janunary 26, 2024

<p align="left">
    <img src="https://skillicons.dev/icons?i=md,linux,bash,vim,maven,postgres,docker,githubactions,nginx,jenkins,kubernetes"/>
</p>

## Further insight

<details>
  <summary></summary>

### Table of contents

Table of contents has been removed due to built-in support on GitHub. Markdown files now automatically generate a table of contents in the header when there are 2 or more headings. The table of contents is interactive and links to the selected section. All 6 Markdown heading levels are supported.

<details>
  <summary>Where to find it:</summary>

  ![Table of contents - gif](https://i0.wp.com/user-images.githubusercontent.com/7900087/113821370-df915480-9730-11eb-8aed-bdc50e2212d5.gif?ssl=1)
</details>

### Trello

**[Trello](https://trello.com) is a project management tool that is used for this internship.** It is a popular, simple, and easy-to-use collaboration tool that enables organizing projects and everything related to them into boards. 

### Git Feature Branch Workflow

<img name="git_feature_branch_workflow.png" src="/resources/git_feature_branch_workflow.png"/>

**The internship adopts the [Git Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow).** The `develop` branch functions as an integration branch for features. For each new task, a `feature` branch is created from the latest `develop` branch. The `main` branch stores the official release history, and at the end of every month, the changes from the `develop` branch are merged into the `main` branch.

### Homebrew

[Homebrew](https://brew.sh/) is the easiest and most flexible way to install the UNIX tools Apple didn’t include with macOS. It can also install software not packaged for your Linux distribution without requiring sudo. Explore [man page](https://docs.brew.sh/Manpage) for more information.

Update Homebrew before installing new packages.
```bash
$ brew update #to update brew
$ brew doctor #to run diagnostics
$ brew upgrade #to upgrade packages
$ brew list #to see a list of all the packages you've installed
```
</details>

## [spring-petclinic-deployment](/00-spring-petclinic-deployment/)

`00-spring-petclinic-deployment` directory contains cloned versions of both the application's frontend and backend which are updated versions resulting from completed tasks:
- `spring-petclinic-rest` [(Original Repository)](https://github.com/spring-petclinic/spring-petclinic-rest) is the backend version of the Spring Petclinic application provides a REST API. 
- `spring-petclinic-angular` [(Original Repository)](https://github.com/spring-petclinic/spring-petclinic-angular) is the Angular frontend application (Client only) which consumes the REST API (from backend spring-petclinic-rest project). Prior to launching the frontend application, it's essential to start the backend server.

## [AuctionApp](https://github.com/EmirKapic/AuctionApp)

`AuctionApp` is the application for which I've designed a CI/CD pipeline to facilitate collaboration among DEV, QA, and PM teams. The repository [auction_app_tests](https://github.com/ajlasisic/auction_app_tests) serves as the centralized location for the tests associated with this application.

## First month

<details>
  <summary></summary>

### Prerequisite: Setup Linux VM

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

### [01 Bash scripting](/01-bash-scripting/)

Task:
- 01 Write a script that gets CPU and Memory usage
- 02 Write a script that tests connectivity to a list of websites and reports the status
- 03 Write a script that pings a host and reports latency
- 04 Write a script that traces the path of a network packet from the source to a destination
- 05 Write a script that tests the DNS resolution time for a list of domains

### [02 Setup local environment for backend app](/02-setup-local-env-backend/)

Task: Clone spring-petclinic-rest repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

### [03 Setup local environment for frontend app](/03-setup-local-env-frontend/)

Task: Clone spring-petclinic-angular repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

### [04 Deploy functional Spring Petclinic App](/04-deploy-functional-app/)

Task: Deploy both frontend and backend spring-petclinic apps. Verify the frontend app is integrated with backend.

### [05 Setup PostgreSQL database](/05-setup-postgresql-db/)

Task: Spring petclinic rest app uses in memory storage by default. There is option to persist data beyond restarts using database. Create local PostgreSQL database which will be used for data persistence.

### [06 Deploy Backend with PostgreSQL integration](/06-backend-postgresql-integration/)

Task: Deploy Backend with PostgreSQL integration.

### [07 Reconfigure Frontend and Backend apps to use environment variables](/07-environment-variables/)

Task: Variables like hostname, username and password often need to be changed. Configure frontend and backend apps to use environment variables for REST_API_URL, Postgres datasource.url, username and password. Fork/clone frontend and backend repositories and make changes (including changes in future tasks) in these repositories.

[Add `.gitignore`](https://github.com/adinpilavdzija/devops-internship-atlantbh/commit/29a79bcb458f4aac729b0d80a7ae8cfb54ab0456)<br>
[Code changes](https://github.com/adinpilavdzija/devops-internship-atlantbh/commit/1f9b95c1855c840c8637bc02ae78911041f3fe9c)

### [08 Dockerize Frontend, Backend and Postgres services](/08-docker/)

Task:
- Create Backend Dockerfile and build docker image
- Create Frontend Dockerfile and build docker image
- Create Database Dockerfile and build docker image
- Push docker images to docker hub
- Deploy functional spring petclinic app using docker containers
- Add volume to PostgreSQL docker container
- Create Docker network for spring petclinic containers

### [09 Create docker-compose file for spring petclinic app](/09-docker-compose/)

Task: Create docker-compose file for spring petclinic app.

</details>

## Second month

<details>
  <summary></summary>

### [10 Create GitHub Actions trigger](/10-github-actions/)

Task:
- GitHub Actions on Pull Request
  - Trigger on each Pull Request on develop branch
  - Validate the build is successfull
- GitHub Actions on merge
  - Local GitHub runner
  - Build applications
  - Build docker images with appropriate tags
  - Deploy docker-compose

### [11 Migrate local docker-compose to internship server](/11-docker-compose-to-server)

Task: 
- Deploy docker-compose on internship server
- Deploy nginx reverse proxy
- Configure nginx to route requests to docker containers (e.g. `frontend.praksa.abhapp.com` to `frontend` docker container)
- Add SSL certificates (letsencrypt)

### [12 Migrate GitHub Actions configuration to use Internship server](/12-github-actions-to-server/)

Task: Migrate GitHub Actions configuration to use Internship server 

### [13 Setup local kubernetes cluster](/13-setup-local-k8s-cluster/)

Task: Use any sort of provider k3d, kind, minikube. Some providers deploy traefik loadbalancer by default. If not provided, deploy one yourself.

</details>

## Third month

<details>
  <summary></summary>

### [14 Collaboration](/14-dev-qa-collab/)

QA intern needs ability to deploy application to local environment for the purposes of testing. This application is from DEV intern.

Task: 
- `Sync` with DEV intern with details how application works
- Setup `Dockerfiles` for FE & BE application
- Prepare `docker-compose.yml` for easier deployment

### [15 Prepare local Jenkins deployment for QA collaboration](/15-jenkins-qa-collab/)

Task: Prepare local Jenkins deployment for QA collaboration

### [16 Migrate docker-compose deployment to kubernetes](/16-k8s/)

Migrate docker-compose deployment to kubernetes:
- Write deployment/statefulset manifests
- Expose applications (use localhost domain and subdomains)

</details>

<p align="center">
    🔵⚪⚫
</p>
