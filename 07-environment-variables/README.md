# Reconfigure Frontend and Backend apps to use environment variables

## Task
Variables like hostname, username and password often need to be changed. Configure frontend and backend apps to use environment variables for REST_API_URL, Postgres datasource.url, username and password

Fork/clone [frontend](https://github.com/spring-petclinic/spring-petclinic-angular) and [backend](https://github.com/spring-petclinic/spring-petclinic-rest) repositories and make changes (including changes in future tasks) in these repositories.

## Environment variable

- [What Is an Environment Variable?](https://kinsta.com/knowledgebase/what-is-an-environment-variable/)
- [An Introduction to Environment Variables and How to Use Them](https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa)

Environment variables are predetermined values that are typically used to provide the ability to configure a value in your code from outside of your application.

Environment variables are variables available to your program/application dynamically during runtime. The value of these variables can come from a range of sources — text files, third-party secret managers, calling scripts, etc.

An environment variable is made up of a name/value pair, and any number may be created and available for reference at a point in time. Value of these environment variables is not hardcoded in your program. These are truly dynamic and can be changed based on the environment that your program is running in.

## Types of environment variables

1. **System Environment Variables** - reside on the topmost root of the system and are the same for all processes running in a system under all the user profiles of the system. Your operating system/system administrator usually sets these, and you’re rarely required to fiddle with them. One of the most common uses of a system environment variable is setting up a `PATH` variable to a global package/library to be used by all users in the system.
2. **User Environment Variables** - those that are local to a user profile in Windows systems or another OS. These variables are used to store user-specific information such as the path to a local installation of libraries that are not to be used by all users, values specific to programs installed only for specific users, etc.
3. **Runtime/Process Environment Variables** - further narrowed down only to the runtime or the process that they are associated with. These are usually set by the parent process that creates the new process and is accompanied by the system and user environment variables as well. You can use terminal scripting to create and store these variables on the fly. Runtime variables are usually not permanent unless scripted, and you need to define them whenever you start a new process.

**In this task, we need to use `Runtime/Process Environment Variables`.**

## Why should we use environment variables?

- **Separation of Concerns** - The design principle states that computer programs should be divided into distinct sections to manage them efficiently. Each section should be based on one of the program’s primary concerns, and there should be minimal coupling between such sections.
- **Maintaining Independent Configuration Sets Across Environments** - we need to be able to switch between sets of configuration data easily.
- **Securing Secrets**

Use cases for environment variables include but are not limited to data such as:
- Execution mode (e.g., production, development, staging, etc.)
- Domain names
- API URL/URI’s
- Public and private authentication keys (only secure in server applications)
- Group mail addresses, such as those for marketing, support, sales, etc.
- Service account names

## Frontend: `environment.ts`

[Building and serving Angular apps](https://angular.io/guide/build)

The project's `src/environments/environment.ts` is a common place where you keep your application settings. You can override default values for additional environments, such as `development` and `staging`, in target-specific configuration files.

Default environment configuration contains variable `production` which is mandatory.
```typescript
export const environment = {
  production: false
};
```

To use the environment configurations you have defined, your components must import the original environments file:
```typescript
import { environment } from './../environments/environment';
```

Example in our app:
```typescript
//environment.ts
export const environment = {
  production: false,
  REST_API_URL: 'http://localhost:9966/petclinic/api/'
};

//pet.service.ts
import {environment} from '../../environments/environment';

private entityUrl = environment.REST_API_URL + 'pets';
```

## Backend: `.env` files

The recommended method for most applications is to save `.env` file at the root of your project, but include them in your `.gitignore` file in order to avoid them from being committed to your main repo (one `.env` file corresponds to each device/environment). The idea here is simple: you store your environment variables in a file named `.env` at the root of your project. The application queries for the variables in this file and loads them for use during runtime.

`.env` files store your app secrets in the form of key-value pairs. The usual format for storing environment variables in a `.env` file is:
```
Key1=Value1
Key2=Value2
```

In our example:
```
//.env
#Environment variables for spring-petclinic-rest
DATABASE=postgres_datasource.url
USERNAME=my_username
PASSWORD=my_password
```

Use environment variables in `${ENV_VARIABLE}` format:
```
//application-postgresql.properties
spring.datasource.url=${DATABASE}
spring.datasource.username=${USERNAME}
spring.datasource.password=${PASSWORD}
```

## `.gitignore`

It is necessary to add `.env` to `.gitignore` and commit change to your repository:
```
# Local configuration, environment variables file
.env
```

## Different ways to use `.env` file

Here are various approaches for effectively integrating and using an .env file:

### `spring.config.import`

Add this to your application-postgresql.properties or another .properties file:
`spring.config.import=optional:file:.env[.properties]`

The `[.properties]` is a hint for spring which translates to `Use this file without an extension as a .properties file`.

### Use `@PropertySource`

Import `PropertySource` and add `@PropertySource("file:.env")` to `PetClinicApplication.java` file.
```java
//PetClinicApplication.java
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource("file:.env") //this 
public class PetClinicApplication extends SpringBootServletInitializer { }
```

### Use `spring-dotenv` library

Use an additional library that adds support for this, such as [spring-dotenv](https://github.com/paulschwarz/spring-dotenv). Check the [current version](https://central.sonatype.com/artifact/me.paulschwarz/spring-dotenv?smo=true). For Maven, add dependency to `pom.xml` file:
```xml
//pom.xml
<dependency>
    <groupId>me.paulschwarz</groupId>
    <artifactId>spring-dotenv</artifactId>
    <version>4.0.0</version>
</dependency>
```

