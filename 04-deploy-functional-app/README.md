# Deploy functional Spring Petclinic App

## Task

Deploy both frontend and backend spring-petclinic apps. Verify the frontend app is integrated with backend.

## Backend configuration

The `application.properties` file is essential for configuring a Spring Boot application and customizing its behavior to suit your specific requirements and environment. Some of the key configuration options are:
- **Profiles**: Profiles enable you to configure different sets of properties for different environments or scenarios. These profiles could be set to active.
- **Port Configuration**: You have the flexibility to specify the port on which the embedded web server will listen. In this case, port is 9966.
- **Context Path**: The context path property defines the base URL at which your application will be accessible. In this case, the application will be available under http://localhost:9966/petclinic/.

```
//application.properties
spring.profiles.active=hsqldb,spring-data-jpa

server.port=9966
server.servlet.context-path=/petclinic/

spring.messages.basename=messages/messages
spring.jpa.open-in-view=false

logging.level.org.springframework=INFO

petclinic.security.enable=false
```

## Frontend configuration 

One of the ways to connect your frontend web code to the backend is using API requests. API stands for Application Programming Interface. Simply put, the client sends a request, and the server responds.
- API Requests are requests sent to an Application Programming Interface (API) in order to retrieve data or execute an action. 
- API Response is the data or information that is returned from a server when an API request is sent. It is typically in the form of a JSON or XML document and contains either a status (“ok”, “error”, etc.) or data (e.g. a list of items).

### Environment configuration

- Define a constant object named `environment` that can be imported and used in other parts of the code.
- Define a property named `REST_API_URL` with the value of the API endpoint's URL. In this case, it's set to a local development server URL.

```
//environment.prod.ts
export const environment = {
  production: true, //false for 'environment.ts' file
  REST_API_URL: 'http://localhost:9966/petclinic/api/'
};
```

### Import `HttpClientModule` in `app.module.ts` file

Most front-end applications need to communicate with a server over the HTTP protocol, to download or upload data and access other back-end services. Angular provides a client HTTP API for Angular applications, the `HttpClient` service class in `@angular/common/http`.

In `app.module.ts` file, import `HttpClientModule` from the `@angular/common/http` angular package and then import `HttpClientModule` in `imports` array.

```
//app.module.ts
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  //...
  imports: [
    HttpClientModule
  ],
  //...
})
```

### Service

Create a service that will send HTTP requests to the server and import `HttpClient`, then use Dependency Injection with the `http` alias. After that, you can use `this.http` to make HTTP method calls to the server.

Example:

```
//pet.service.ts
import {HttpClient} from '@angular/common/http';

  private entityUrl = environment.REST_API_URL + 'pets';

  constructor(private http: HttpClient, private httpErrorHandler: HttpErrorHandler) {
    this.handlerError = httpErrorHandler.createHandleError('OwnerService');
  }

    getPets(): Observable<Pet[]> {
    return this.http.get<Pet[]>(this.entityUrl)
      .pipe(
        catchError(this.handlerError('getPets', []))
      );
  } 
```

### Component

Create a component and utilize its service methods for retrieving, adding, updating, or deleting data on an Angular page.

Example:

```
//pet-add.component.ts
import {PetService} from '../pet.service';

  constructor(private ownerService: OwnerService, private petService: PetService,
              private petTypeService: PetTypeService, private router: Router, private route: ActivatedRoute) { ... }
```

## Screenshots 

Screenshots for verification that the frontend app is integrated with backend:

<details>
  <summary></summary>

Backend GET:
![01_backend_get](/04-deploy-functional-app/screenshots/01_backend_get.png)

Frontend POST:
![02_frontend_post](/04-deploy-functional-app/screenshots/02_frontend_post.png)

Backend GET:
![03_backend_get](/04-deploy-functional-app/screenshots/03_backend_get.png)

Frontend GET:
![04_frontend_get](/04-deploy-functional-app/screenshots/04_frontend_get.png)

Backend POST:
![05_backend_post](/04-deploy-functional-app/screenshots/05_backend_post.png)

Frontend GET:
![06_frontend_get](/04-deploy-functional-app/screenshots/06_frontend_get.png)
</details>
